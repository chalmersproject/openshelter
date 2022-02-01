import { FC, useCallback, useEffect, useMemo } from "react";
import { apiBaseURL, isBrowser } from "~/utils/config";
import { pick } from "lodash";

import { useLoaderData } from "remix";
import { useCSRFContext, CSRFContext } from "~/utils/csrf";

import type { ApolloError, ServerError } from "@apollo/client";
import type { ApolloQueryResult, QueryResult } from "@apollo/client";
import { ApolloClient as Client } from "@apollo/client";
import { ApolloProvider as Provider } from "@apollo/client";

import type { DocumentNode, TypedDocumentNode } from "@apollo/client";
import type { QueryHookOptions, QueryOptions } from "@apollo/client";
import type { OperationVariables } from "@apollo/client";
import { InMemoryCache, NormalizedCacheObject } from "@apollo/client";
import { NetworkStatus } from "@apollo/client";

import { ApolloLink } from "@apollo/client";
import { HttpLink } from "@apollo/client";
// import { RetryLink } from "@apollo/client/link/retry";
// import { SentryLink } from "apollo-link-sentry";
// import { createPersistedQueryLink } from "@apollo/client/link/persisted-queries";
import { split as splitLinks } from "@apollo/client";
import { setContext as setLinkContext } from "@apollo/client/link/context";
import { from as mergeLinks } from "@apollo/client";
import CableLink from "graphql-ruby-client/subscriptions/ActionCableLink";
import cable from "~/utils/cable.client";

import { getMainDefinition } from "@apollo/client/utilities";
import { useApolloClient, useQuery } from "@apollo/client";

import type { TypedTypePolicies as TypePolicies } from "~/graphql/apollo.generated";

import { HiOutlineExclamation } from "react-icons/hi";
import { useNotifications } from "@mantine/notifications";

const typePolicies: TypePolicies = {};

const createTerminatingLink = (request?: Request): ApolloLink => {
  const httpLink = new HttpLink({
    uri: isBrowser ? "/api/graphql" : apiBaseURL + "/graphql",
    fetch: async (input, init = {}) => {
      if (request) {
        const headers = new Headers(init.headers);
        request.headers.forEach((value, key) => {
          if (!headers.has(key)) {
            headers.set(key, value);
          }
        });
        init.headers = headers;
        init.referrer = request.referrer;
      }
      return fetch(input, init);
    },
  });
  if (!isBrowser) {
    return httpLink;
  }

  // Browser only!
  const cableLink = new CableLink({ cable, channelName: "GraphQLChannel" });
  return splitLinks(
    ({ query }) => {
      const definition = getMainDefinition(query);
      return (
        definition.kind === "OperationDefinition" &&
        definition.operation === "subscription"
      );
    },
    cableLink,
    httpLink,
  );
};

const createCSRFLink = ({ token }: CSRFContext): ApolloLink => {
  return setLinkContext(async (operation, { headers }) => ({
    headers: {
      ...headers,
      "X-CSRF-Token": token,
    },
  }));
};

type ApolloClientOptions = {
  request?: Request;
  csrf?: CSRFContext;
};

const createApolloClient = (
  options?: ApolloClientOptions,
): Client<NormalizedCacheObject> => {
  const { request, csrf } = options ?? {};
  if (isBrowser && !csrf) {
    throw new Error("Missing CSRF context");
  }
  const link = mergeLinks([
    // new SentryLink(),
    // ...(isBrowser ? [new RetryLink()] : []),
    ...(isBrowser ? [createCSRFLink(csrf!)] : []),
    createTerminatingLink(request),
  ]);
  return new Client({
    ssrMode: !isBrowser,
    link,
    cache: new InMemoryCache({ typePolicies }),
    defaultOptions: {
      watchQuery: {
        // The first time a browser-side useQuery is called, only use data
        // injected into the cache from Remix loaders.
        fetchPolicy: "cache-only",
      },
    },
  });
};

export const ApolloProvider: FC = ({ children }) => {
  const csrf = useCSRFContext();
  const client = useMemo(() => createApolloClient({ csrf }), [csrf]);
  return <Provider client={client}>{children}</Provider>;
};

export const formatApolloError = (error: ApolloError): string => {
  const { graphQLErrors, networkError, message } = error;
  if (graphQLErrors) {
    const [firstError] = graphQLErrors;
    if (firstError) {
      return firstError.message;
    }
  }
  if (networkError) {
    if ((networkError as ServerError | undefined)?.statusCode === 500) {
      return "An internal server error occurred.";
    }
  }
  return message;
};

export const useApolloErrorNotification = (
  title?: string,
): ((error: ApolloError) => void) => {
  const { showNotification } = useNotifications();
  return useCallback(
    error => {
      const message = formatApolloError(error);
      showNotification({
        title,
        message,
        color: "red",
        icon: <HiOutlineExclamation />,
      });
    },
    [showNotification, title],
  );
};

export type QueryHookFunction = typeof useQuery;

type LoaderQueryResult<TData, TVariables> = Pick<
  ApolloQueryResult<TData>,
  "data" | "error" | "networkStatus"
> & {
  variables?: TVariables;
};

export function useLoaderQuery<TData = any, TVariables = OperationVariables>(
  query: DocumentNode | TypedDocumentNode,
  options: QueryHookOptions<TData, TVariables> = {},
): QueryResult<TData, TVariables> {
  const client = useApolloClient();
  const resultFromLoader =
    useLoaderData<LoaderQueryResult<TData, TVariables>>();

  useEffect(() => {
    const { data, error, variables } = resultFromLoader;
    if (data && !error) {
      client.writeQuery({ query, data, variables });
    }
  }, [client, query, resultFromLoader]);

  const { variables, ...otherOptions } = options;
  const result = useQuery(query, {
    ...otherOptions,
    variables: variables || resultFromLoader.variables,
    skip: !!resultFromLoader.error,
  });

  const { called, loading } = result;
  if (!called || loading) {
    // Loading data from the cache happens asynchronously, in the meantime
    // we emulate a completed result from the loader data.
    const { data, error, variables } = resultFromLoader;
    return {
      ...result,
      called: true,
      loading: false,
      networkStatus: error ? NetworkStatus.error : NetworkStatus.ready,
      data,
      error,
      variables,
    };
  }
  return result;
}

function serializeQueryResult<TData, TVariables>(
  result: ApolloQueryResult<TData>,
  variables?: TVariables,
): LoaderQueryResult<TData, TVariables> {
  return {
    ...pick(result, "data", "error", "networkStatus"),
    variables,
  };
}

export type LoaderQueryOptions<TData, TVariables> = QueryOptions<
  TVariables,
  TData
> & {
  request: Request;
};

export async function runLoaderQuery<T, TVariables>({
  request,
  ...options
}: LoaderQueryOptions<T, TVariables>): Promise<
  LoaderQueryResult<T, TVariables>
> {
  const client = createApolloClient({ request });
  const result = await client.query<T, TVariables>(options);
  return serializeQueryResult(result, options.variables);
}

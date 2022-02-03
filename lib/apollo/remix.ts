import { useEffect } from "react";
import { useLoaderData } from "remix";
import { pick } from "lodash";

import type { ApolloQueryResult, QueryResult } from "@apollo/client";
import type { DocumentNode, TypedDocumentNode } from "@apollo/client";
import type { QueryHookOptions, QueryOptions } from "@apollo/client";
import type { OperationVariables } from "@apollo/client";
import { NetworkStatus } from "@apollo/client";
import { useApolloClient, useQuery } from "@apollo/client";

import { createApolloClient } from "~/apollo/client";

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

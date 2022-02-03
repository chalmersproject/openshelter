import { apiBaseURL, isBrowser } from "~/config";
import { CSRFContext } from "~/csrf";

import { ApolloClient as Client } from "@apollo/client";
import { InMemoryCache, NormalizedCacheObject } from "@apollo/client";

import { ApolloLink } from "@apollo/client";
import { HttpLink } from "@apollo/client";
// import { RetryLink } from "@apollo/client/link/retry";
// import { SentryLink } from "apollo-link-sentry";
// import { createPersistedQueryLink } from "@apollo/client/link/persisted-queries";
import { from as fromLinks } from "@apollo/client";

// Split GraphQL requests between protocols.
import { split as splitLinks } from "@apollo/client";
import { getMainDefinition } from "@apollo/client/utilities";
import { setContext as setLinkContext } from "@apollo/client/link/context";

// Use Action Cable to implement GraphQL Subscriptions.
import CableLink from "graphql-ruby-client/subscriptions/ActionCableLink";
import cable from "~/cable.client";

import type { TypedTypePolicies as TypePolicies } from "~/graphql/apollo.generated";

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

export type ApolloClientOptions = {
  request?: Request;
  csrf?: CSRFContext;
};

export const createApolloClient = (
  options?: ApolloClientOptions,
): Client<NormalizedCacheObject> => {
  const { request, csrf } = options ?? {};
  if (isBrowser && !csrf) {
    throw new Error("Missing CSRF context");
  }
  const link = fromLinks([
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

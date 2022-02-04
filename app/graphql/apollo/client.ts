import { CSRFContext } from "~/utils/csrf";
import { isBrowser, isServer } from "~/application";

import type { ApolloLink, NormalizedCacheObject } from "@apollo/client";
import { ApolloClient as Client } from "@apollo/client";
import { InMemoryCache } from "@apollo/client";
import { from as fromLinks } from "@apollo/client";
// import { RetryLink } from "@apollo/client/link/retry";
// import { SentryLink } from "apollo-link-sentry";
// import { createPersistedQueryLink } from "@apollo/client/link/persisted-queries";

// Split GraphQL requests between protocols.
import { setContext as setLinkContext } from "@apollo/client/link/context";
import { createTerminatingLink } from "~/graphql/apollo/link";

import type { StrictTypedTypePolicies as TypePolicies } from "~/graphql/apollo/helpers.generated";

const typePolicies: TypePolicies = {};

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
    ssrMode: isServer,
    link,
    cache: new InMemoryCache({ typePolicies }),
    defaultOptions: {
      watchQuery: {
        // The first time a browser-side `watchQuery` is run, attempt to load
        // data from the cache, before making a network request.
        fetchPolicy: "cache-first",
      },
    },
  });
};

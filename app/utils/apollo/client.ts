import { isBrowser } from "~/application";
import { CSRFContext } from "~/utils/csrf";

import { ApolloClient as Client } from "@apollo/client";
import { InMemoryCache, NormalizedCacheObject } from "@apollo/client";

import type { ApolloLink } from "@apollo/client";
// import { RetryLink } from "@apollo/client/link/retry";
// import { SentryLink } from "apollo-link-sentry";
// import { createPersistedQueryLink } from "@apollo/client/link/persisted-queries";
import { from as fromLinks } from "@apollo/client";

// Split GraphQL requests between protocols.
import { setContext as setLinkContext } from "@apollo/client/link/context";
import { createTerminatingLink } from "~/utils/apollo/link";

import type { TypedTypePolicies as TypePolicies } from "~/graphql/apollo.generated";

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

import { apiBaseURL, isBrowser } from "~/application";

import type { ApolloLink } from "@apollo/client";
import { HttpLink } from "@apollo/client";
import { createClientOnlyLink } from "~/utils/apollo/link.client";

export const createTerminatingLink = (request?: Request): ApolloLink => {
  const link = new HttpLink({
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
  return isBrowser ? createClientOnlyLink(link) : link;
};

import type { ApolloLink } from "@apollo/client";
import { split as splitLinks } from "@apollo/client";
import { getOperationDefinition } from "@apollo/client/utilities";

// Use Action Cable to implement GraphQL Subscriptions.
import CableLink from "graphql-ruby-client/subscriptions/ActionCableLink";
import cable from "~/channels/cable.client";

export const createSubscriptionsLink = (link: ApolloLink): ApolloLink => {
  const cableLink = new CableLink({ cable, channelName: "GraphQLChannel" });
  return splitLinks(
    ({ query }) => {
      const { operation } = getOperationDefinition(query) || {};
      return operation === "subscription";
    },
    cableLink,
    link,
  );
};

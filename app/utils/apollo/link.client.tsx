import type { ApolloLink } from "@apollo/client";
import { split as splitLinks } from "@apollo/client";
import { getMainDefinition } from "@apollo/client/utilities";

// Use Action Cable to implement GraphQL Subscriptions.
import CableLink from "graphql-ruby-client/subscriptions/ActionCableLink";
import cable from "~/utils/cable.client";

export const createClientOnlyLink = (link: ApolloLink): ApolloLink => {
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
    link,
  );
};

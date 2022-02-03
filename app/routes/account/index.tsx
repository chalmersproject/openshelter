import { Group, Text } from "@mantine/core";
// import { isBrowser } from "~/utils/config";

import type { LoaderFunction } from "remix";
import { gql } from "@apollo/client";
import { useSubscription } from "@apollo/client";
import { useLoaderQuery, runLoaderQuery } from "~/utils/apollo_remix";

import {
  AccountIndexRouteQueryDocument,
  AccountIndexRouteQuery,
  AccountIndexRouteQueryVariables,
} from "~/graphql/schema.generated";

import {
  AccountIndexRouteSubscriptionDocument,
  AccountIndexRouteSubscription,
  AccountIndexRouteSubscriptionVariables,
} from "~/graphql/schema.generated";

gql`
  query AccountIndexRouteQuery {
    viewer {
      id
      email
      createdAt
      updatedAt
    }
  }
`;

gql`
  subscription AccountIndexRouteSubscription {
    testField {
      value
    }
  }
`;

export const loader: LoaderFunction = async ({ request }) => {
  const result = await runLoaderQuery<
    AccountIndexRouteQuery,
    AccountIndexRouteQueryVariables
  >({
    request,
    query: AccountIndexRouteQueryDocument,
  });
  return result;
};

export default function AccountIndexRoute() {
  const { data } = useLoaderQuery<
    AccountIndexRouteQuery,
    AccountIndexRouteQueryVariables
  >(AccountIndexRouteQueryDocument);

  const { data: subscriptionData } = useSubscription<
    AccountIndexRouteSubscription,
    AccountIndexRouteSubscriptionVariables
  >(AccountIndexRouteSubscriptionDocument, {
    skip: true,
    onSubscriptionData: ({ subscriptionData: { error } }) => {
      if (error) {
        console.error("Error from subscription:", error);
      }
    },
  });

  return (
    <Group direction="column" align="stretch" spacing="md">
      <Text component="pre">{JSON.stringify(data, undefined, 2)}</Text>
      <Text component="pre">
        {JSON.stringify(subscriptionData, undefined, 2)}
      </Text>
    </Group>
  );
}

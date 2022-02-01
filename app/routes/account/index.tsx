import { Group, Text } from "@mantine/core";

import type { LoaderFunction } from "remix";
import { gql } from "@apollo/client";
import { useLoaderQuery, runLoaderQuery } from "~/utils/apollo";

import {
  AccountIndexRouteDocument,
  AccountIndexRouteQuery,
  AccountIndexRouteQueryVariables,
} from "~/graphql/schema.generated";

gql`
  query AccountIndexRoute {
    viewer {
      id
    }
  }
`;

export const loader: LoaderFunction = async ({ request }) => {
  const result = await runLoaderQuery<
    AccountIndexRouteQuery,
    AccountIndexRouteQueryVariables
  >({
    request,
    query: AccountIndexRouteDocument,
  });
  console.log({ result });
  return result;
};

export default function AccountIndexRoute() {
  const { data } = useLoaderQuery<
    AccountIndexRouteQuery,
    AccountIndexRouteQueryVariables
  >(AccountIndexRouteDocument);

  return (
    <Group direction="column" align="stretch" spacing="md">
      <Text component="pre">{JSON.stringify(data, undefined, 2)}</Text>
    </Group>
  );
}

import { Form } from "remix";
import { FormAuthenticity } from "~/components/csrf";

import { Group } from "@mantine/core";
import { Button } from "@mantine/core";
import { Text } from "@mantine/core";

import type { LoaderFunction } from "remix";
import { gql } from "@apollo/client";
import { useLoaderQuery, runLoaderQuery } from "~/utils/apollo";

import {
  AccountIndexRouteQueryDocument,
  AccountIndexRouteQuery,
  AccountIndexRouteQueryVariables,
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
  const {
    data: { viewer },
  } = useLoaderQuery<AccountIndexRouteQuery, AccountIndexRouteQueryVariables>(
    AccountIndexRouteQueryDocument,
  );

  return (
    <Group direction="column" align="stretch" spacing="md">
      <Group direction="column" align="stretch" spacing={0}>
        <Text weight={600}>Viewer:</Text>
        <Text component="pre" sx={{ margin: 0 }}>
          {JSON.stringify(viewer, undefined, 2)}
        </Text>
      </Group>
      {viewer && (
        <Form method="post" action="/account/logout">
          {/* <FormAuthenticityField /> */}
          <Button type="submit">Logout</Button>
        </Form>
      )}
    </Group>
  );
}

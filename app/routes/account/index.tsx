import { Button, Group, Text } from "@mantine/core";
import { Form } from "remix";

import { useLoaderData, useActionData } from "remix";
import { createLoader, createAction } from "~/utils/remix";

export const action = createAction("/api/account");
export const loader = createLoader("/api/account");

export type AccountLoginLoaderData = {
  user: null;
};

export type AccountLoginActionData = any;

export default function Account() {
  const actionData = useActionData();
  const { csrfParams, ...loaderData } = useLoaderData();
  return (
    <Group direction="column" align="stretch" spacing="md">
      <Form {...{ csrfParams }} method="put">
        <Button type="submit">Do Stuff</Button>
      </Form>
      <Text component="pre">
        {JSON.stringify({ loaderData, csrfParams }, undefined, 2)}
      </Text>
      <Text component="pre">
        {JSON.stringify({ actionData }, undefined, 2)}
      </Text>
    </Group>
  );
}

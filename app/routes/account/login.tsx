import { Form } from "remix";

import { useActionData } from "remix";
import { createAction } from "~/utils/rails/remix";

import { Button, Group, Text } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";

import { FormAuthenticityField } from "~/utils/rails/csrf";

export const action = createAction("/api/account/login");

export type AccountLoginActionData = {
  error?: string;
};

export default function AccountLogin() {
  const actionData = useActionData<AccountLoginActionData>();
  return (
    <Form method="post">
      <FormAuthenticityField />
      <Group direction="column" align="stretch">
        <TextInput
          name="email"
          label="Email"
          placeholder="email@example.com"
          required
        />
        <PasswordInput
          name="password"
          label="Password"
          placeholder="password"
          required
        />
        <Button type="submit">Sign In</Button>
      </Group>
      <Text component="pre">{JSON.stringify({ actionData })}</Text>
    </Form>
  );
}

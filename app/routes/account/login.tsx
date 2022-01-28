import { useLoaderData } from "remix";

import { Button, Group, Text } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";

import { Form, CSRFHeaders } from "~/utils/rails";
export { loader } from "~/utils/rails";

export type AccountLoginData = {
  user: null;
  csrfHeaders: CSRFHeaders;
};

export default function AccountLogin() {
  const { user, csrfHeaders } = useLoaderData<AccountLoginData>();
  return (
    <Form {...{ csrfHeaders }} reloadDocument>
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
      <Text>{JSON.stringify({ user })}</Text>
    </Form>
  );
}

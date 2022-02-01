import { useEffect } from "react";
import { Form, redirect } from "remix";
import { useActionData, ActionFunction } from "remix";
import { apiBaseURL } from "~/utils/config";

import { HiOutlineExclamation } from "react-icons/hi";

import { Button, Group } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";
import { useNotifications } from "@mantine/notifications";

import type { GraphQLErrors } from "@apollo/client/errors";

import { FormAuthenticityField } from "~/utils/csrf";

export const action: ActionFunction = async ({ request }) => {
  const { body, headers } = request;
  const response = await fetch(apiBaseURL + "/auth/login", {
    method: "POST",
    headers,
    body,
  });
  if (response.ok) {
    const { headers } = response;
    return redirect(request.referrer || "/account", { headers });
  }
  return response;
};

type LoginData = {
  errors: GraphQLErrors;
};

export default function AccountLogin() {
  const { showNotification } = useNotifications();
  const data = useActionData<LoginData>();
  useEffect(() => {
    const [firstError] = data?.errors || [];
    if (firstError) {
      showNotification({
        title: "Login failed",
        message: firstError.message,
        color: "red",
        icon: <HiOutlineExclamation />,
      });
    }
  }, [data]);
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
    </Form>
  );
}

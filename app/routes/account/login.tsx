import { useEffect } from "react";
import { Form, redirect } from "remix";
import { useActionData, ActionFunction } from "remix";
import { apiBaseURL } from "~/config";

import { HiOutlineExclamation } from "react-icons/hi";

import { Button, Group } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";
import { useNotifications } from "@mantine/notifications";

import { FormAuthenticityField } from "~/components/csrf";

import type { GraphQLErrors } from "@apollo/client/errors";

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
      const { message } = firstError;
      const messageCapitalized =
        message.charAt(0).toUpperCase() + message.slice(1);
      const messageFormatted =
        messageCapitalized + (message.endsWith(".") ? "" : ".");
      console.log({ messageCapitalized, messageFormatted });
      showNotification({
        title: "Login failed",
        message: messageFormatted,
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

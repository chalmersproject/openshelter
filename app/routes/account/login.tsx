import { useEffect, useMemo } from "react";
import { useActionData, ActionFunction } from "remix";
import { useSearchParams } from "remix";
import { redirect } from "remix";
import { serverHost } from "~/application";

import { Form } from "remix";
import { FormAuthenticityField } from "~/components/csrf";

import { HiOutlineExclamation } from "react-icons/hi";

import { Button, Group } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";
import { useNotifications } from "@mantine/notifications";

import type { GraphQLErrors } from "@apollo/client/errors";

export const action: ActionFunction = async ({ request }) => {
  const url = new URL(request.url);
  const searchParams = new URLSearchParams(url.searchParams);
  const redirectURL = searchParams.get("redirect_url");
  const response = await fetch(serverHost + "/api/auth/login", {
    method: "POST",
    headers: request.headers,
    body: request.body,
  });
  return redirect(redirectURL || "/", { headers: response.headers });
};

type LoginData = {
  readonly errors: GraphQLErrors;
};

export default function AccountLogin() {
  const [searchParams] = useSearchParams();
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

  const action = useMemo(() => {
    if (searchParams) {
      return "/account/login" + `?${searchParams}`;
    }
    return undefined;
  }, [searchParams]);
  return (
    <Form method="post" action={action} reloadDocument>
      <FormAuthenticityField />
      <Group direction="column" align="stretch">
        <TextInput
          type="text"
          name="email"
          label="Email"
          placeholder="email@example.com"
          required
        />
        <PasswordInput
          type="password"
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

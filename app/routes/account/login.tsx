import { useEffect, useMemo } from "react";
import { useActionData, ActionFunction } from "remix";
import { apiBaseURL } from "~/application";

import { HiOutlineExclamation } from "react-icons/hi";

import { Button, Group } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";
import { useNotifications } from "@mantine/notifications";

import { FormAuthenticityField } from "~/components/csrf";

import type { GraphQLErrors } from "@apollo/client/errors";

export const action: ActionFunction = async ({ request }) => {
  const { headers, body } = request;
  return fetch(apiBaseURL + "/auth/login", {
    method: "POST",
    headers,
    body,
    redirect: "manual",
  });
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

  const redirectURL = useMemo(() => {
    if (typeof window === "undefined") {
      return undefined;
    }
    const url = new URL(window.location.href);
    return url.searchParams.get("redirect_url");
  }, []);
  return (
    <form method="post">
      <FormAuthenticityField />
      {!!redirectURL && (
        <input type="hidden" name="redirect_url" value={redirectURL} />
      )}
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
    </form>
  );
}

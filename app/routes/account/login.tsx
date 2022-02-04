import { useEffect, useMemo } from "react";

import type { Errors } from "~/utils/errors";
import { formatError } from "~/utils/errors";

import type { ActionFunction } from "remix";
import { useActionData } from "remix";
import { useSearchParams } from "remix";
import { redirect } from "remix";
import { serverHost } from "~/application";
import { isEmpty, first } from "lodash";

import { HiOutlineExclamation } from "react-icons/hi";

import { Form } from "remix";
import { FormAuthenticity } from "~/components/csrf";

import { Button, Group } from "@mantine/core";
import { TextInput, PasswordInput } from "@mantine/core";
import { useNotifications } from "@mantine/notifications";

export const action: ActionFunction = async ({ request }) => {
  const url = new URL(request.url);
  const params = new URLSearchParams(url.searchParams);
  const redirectURL = params.get("redirect_url");
  const response = await fetch(serverHost + "/api/auth/login", {
    method: "POST",
    headers: request.headers,
    body: request.body,
  });
  if (response.ok) {
    return redirect(redirectURL || "/", { headers: response.headers });
  }
  return response;
};

export type ActionData = {
  readonly errors: Errors;
};

export default function AccountLoginRoute() {
  const { showNotification } = useNotifications();

  const data = useActionData<ActionData>();
  useEffect(() => {
    const { errors } = data ?? {};
    if (!isEmpty(errors)) {
      const message = formatError(first(errors!)!);
      showNotification({
        title: "Login failed",
        message,
        color: "red",
        icon: <HiOutlineExclamation />,
      });
    }
  }, [data]);

  const [params] = useSearchParams();
  const action = useMemo(() => {
    const paramsString = params.toString();
    return "/account/login" + paramsString ? `?${params}` : "";
  }, [params]);

  return (
    <Form method="post" action={action} reloadDocument>
      <FormAuthenticity />
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

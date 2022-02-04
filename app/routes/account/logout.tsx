import type { FC } from "react";

import type { ActionFunction } from "remix";
import { useActionData } from "remix";
import { redirect } from "remix";
import { serverHost } from "~/application";

import { Container } from "@mantine/core";

import type { Errors } from "~/utils/errors";
import { NotFound, Unexpected } from "~/components/errors";

export const action: ActionFunction = async ({ request }) => {
  const url = new URL(request.url);
  const searchParams = new URLSearchParams(url.searchParams);
  const redirectURL = searchParams.get("redirect_url");
  const response = await fetch(serverHost + "/api/auth/logout", {
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

const AccountLogoutRoute: FC = () => {
  const data = useActionData<ActionData>();
  return (
    <Container size="sm" sx={{ paddingTop: 20, paddingBottom: 10 }}>
      {data ? <Unexpected error={data.errors} /> : <NotFound />}
    </Container>
  );
};

export default AccountLogoutRoute;

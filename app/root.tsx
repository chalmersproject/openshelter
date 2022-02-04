import { Meta, MetaFunction } from "remix";
import { Links, LinksFunction } from "remix";
import { LiveReload, Outlet, Scripts, ScrollRestoration } from "remix";
import { isDevelopment } from "~/application";
import { isEmpty, first } from "lodash";

import { CSRFMeta } from "~/components/csrf";
import { AppProviders, AppLayout } from "~/components/app";

import type { LoaderFunction } from "remix";
import { gql } from "@apollo/client";
import { useLoaderData } from "remix";
import { runLoaderQuery, formatQueryError } from "~/utils/apollo";

import {
  AppQueryDocument,
  AppQuery,
  AppQueryVariables,
} from "~/graphql/schema.generated";

export const meta: MetaFunction = () => {
  return { title: "App" };
};

export const links: LinksFunction = () => {
  return [
    { rel: "preconnect", href: "https://fonts.googleapis.com" },
    {
      rel: "preconnect",
      href: "https://fonts.gstatic.com",
      crossOrigin: "anonymous",
    },
    {
      rel: "stylesheet",
      href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap",
    },
  ];
};

gql`
  query AppQuery {
    csrfToken
    version
    viewer {
      id
      ...AppLayoutViewer
    }
  }
`;

export const loader: LoaderFunction = async ({ request }) => {
  const { data, errors } = await runLoaderQuery<AppQuery, AppQueryVariables>({
    request,
    query: AppQueryDocument,
  });
  if (!isEmpty(errors)) {
    const message = formatQueryError(first(errors)!);
    throw new Error(`Failed to load application data: ${message}`);
  }
  if (!data) {
    throw new Error("Missing application data.");
  }
  return data;
};

export default function App() {
  const { csrfToken, version, viewer } = useLoaderData<AppQuery>();
  return (
    <AppProviders {...{ csrfToken }}>
      <html lang="en">
        <head>
          <meta charSet="utf-8" />
          <meta name="viewport" content="width=device-width,initial-scale=1" />
          <CSRFMeta />
          <Meta />
          <Links />
        </head>
        <body>
          <AppLayout {...{ version, viewer }}>
            <Outlet />
          </AppLayout>
          <ScrollRestoration />
          <Scripts />
          {isDevelopment && <LiveReload port={3100} />}
        </body>
      </html>
    </AppProviders>
  );
}

import {
  Links,
  LiveReload,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
  useLoaderData,
} from "remix";
import type { MetaFunction, LoaderFunction } from "remix";

export const meta: MetaFunction = () => {
  return { title: "New Remix App" };
};

export type LoaderData = {
  csrfParam: string;
  csrfToken: string;
};

export const loader: LoaderFunction = ({ request }) => {
  const { headers } = request;
  const csrfParam = headers.get("X-CSRF-Param");
  const csrfToken = headers.get("X-CSRF-Token");
  return { csrfParam, csrfToken };
};

export default function App() {
  const { csrfParam, csrfToken } = useLoaderData<LoaderData>();
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <meta name="csrf-param" content={csrfParam} />
        <meta name="csrf-token" content={csrfToken} />
        <Meta />
        <Links />
      </head>
      <body>
        <Outlet />
        <ScrollRestoration />
        <Scripts />
        {process.env.NODE_ENV === "development" && <LiveReload />}
      </body>
    </html>
  );
}

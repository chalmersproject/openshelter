import { Meta, MetaFunction } from "remix";
import { Links, LinksFunction } from "remix";
import { useLoaderData, LoaderFunction } from "remix";
import { LiveReload, Outlet, Scripts, ScrollRestoration } from "remix";

import { MantineProvider } from "@mantine/core";
import { AppShell, Header, Text, Center } from "@mantine/core";

import { isDevelopment } from "~/utils/application";
import { themeOverride } from "~/utils/mantine";

import { extractCSRFHeaders, CSRFHeaders } from "~/utils/rails/csrf";

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

export type RootData = {
  csrfHeaders: CSRFHeaders;
};

export const loader: LoaderFunction = ({ request }) => {
  const csrfHeaders = extractCSRFHeaders(request);
  return { csrfHeaders };
};

export default function App() {
  const { csrfHeaders } = useLoaderData<RootData>();
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <meta name="csrf-param" content={csrfHeaders.param} />
        <meta name="csrf-token" content={csrfHeaders.token} />
        <Meta />
        <Links />
      </head>
      <body>
        <MantineProvider
          theme={themeOverride}
          withNormalizeCSS
          withGlobalStyles
        >
          <AppShell
            header={
              <Header
                height={48}
                sx={({ colors }) => ({
                  background: colors.gray[1],
                })}
              >
                <Center style={{ height: "100%" }}>
                  <Text color="slate" size="lg" weight="bold">
                    Chalmers Project
                  </Text>
                </Center>
              </Header>
            }
          >
            <Outlet />
          </AppShell>
        </MantineProvider>
        <ScrollRestoration />
        <Scripts />
        {isDevelopment && <LiveReload port={8000} />}
      </body>
    </html>
  );
}

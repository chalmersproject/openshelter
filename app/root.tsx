import type { FC } from "react";
import { Meta, MetaFunction } from "remix";
import { Links, LinksFunction } from "remix";
import { LiveReload, Outlet, Scripts, ScrollRestoration } from "remix";
import { useLoaderData, LoaderFunction } from "remix";
import { apiBaseURL, isDevelopment } from "~/application";

import { MantineProvider } from "@mantine/core";
import { AppShell, Header } from "@mantine/core";
import { Box, Group } from "@mantine/core";
import { Text, Badge } from "@mantine/core";
import { NotificationsProvider } from "@mantine/notifications";
import { themeOverride, sx } from "~/utils/mantine";

import { CSRFProvider, CSRFMeta } from "~/components/csrf";
import { ApolloProvider } from "~/components/apollo";

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

export const loader: LoaderFunction = async () => {
  const response = await fetch(apiBaseURL + "/meta");
  if (!response.ok) {
    throw new Error("Failed to load application metadata.");
  }
  return response;
};

type AppData = {
  readonly version: string;
  readonly csrf: Record<string, string>;
};

export default function App() {
  const { version, csrf } = useLoaderData<AppData>();
  return (
    <AppProviders csrf={csrf}>
      <html lang="en">
        <head>
          <meta charSet="utf-8" />
          <meta name="viewport" content="width=device-width,initial-scale=1" />
          <CSRFMeta />
          <Meta />
          <Links />
        </head>
        <body>
          <AppLayout version={version}>
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

type AppProvidersProps = { readonly csrf: Record<string, string> };

const AppProviders: FC<AppProvidersProps> = ({ csrf, children }) => {
  return (
    <CSRFProvider csrf={csrf}>
      <MantineProvider theme={themeOverride} withNormalizeCSS withGlobalStyles>
        <NotificationsProvider>
          <ApolloProvider>{children}</ApolloProvider>
        </NotificationsProvider>
      </MantineProvider>
    </CSRFProvider>
  );
};

type AppLayoutProps = { version: string };

const AppLayout: FC<AppLayoutProps> = ({ children, version }) => {
  return (
    <AppShell
      header={
        <Header
          height={44}
          sx={({ colors }) => ({
            background: colors.gray[1],
          })}
        >
          <Group
            align="center"
            sx={({ spacing }) => ({
              height: "100%",
              paddingLeft: spacing.sm,
              paddingRight: spacing.sm,
            })}
          >
            <Group position="left" sx={{ flex: 1 }} />
            <Box>
              <Text
                color="gray"
                size="md"
                weight="bold"
                sx={sx(({ letterSpacing }) => ({
                  letterSpacing: letterSpacing.widest,
                }))}
              >
                CHALMERS PROJECT
              </Text>
            </Box>
            <Group position="right" sx={{ flex: 1 }}>
              <Badge
                size="sm"
                variant="outline"
                sx={{ textTransform: "unset" }}
              >
                v{version}
              </Badge>
            </Group>
          </Group>
        </Header>
      }
    >
      {children}
    </AppShell>
  );
};

import type { FC } from "react";
import { Meta, MetaFunction } from "remix";
import { Links, LinksFunction } from "remix";
import { LiveReload, Outlet, Scripts, ScrollRestoration } from "remix";
import { createLoader, useLoaderDataRequired } from "~/utils/remix";
import * as struct from "superstruct";

import { MantineProvider } from "@mantine/core";
import { AppShell, Header } from "@mantine/core";
import { Box, Group } from "@mantine/core";
import { Text, Badge } from "@mantine/core";
import { NotificationsProvider } from "@mantine/notifications";

import { FormAuthenticityProvider } from "~/utils/rails/csrf";
import { isDevelopment } from "~/utils/application";
import { themeOverride, sx } from "~/utils/mantine";

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

export const loader = createLoader("/api");

export const AppLoaderData = struct.object({
  version: struct.string(),
  csrf_param: struct.string(),
  csrf_token: struct.string(),
});

export default function App() {
  const data = useLoaderDataRequired(AppLoaderData);
  const { version, csrf_param: csrfParam, csrf_token: csrfToken } = data!;
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        {/* <CSRFMeta {...{ csrfParam, csrfToken }} /> */}
        <Meta />
        <Links />
      </head>
      <body>
        <AppProviders {...{ csrfParam, csrfToken }}>
          <AppLayout version={version}>
            <Outlet />
          </AppLayout>
        </AppProviders>
        <ScrollRestoration />
        <Scripts />
        {isDevelopment && <LiveReload port={3100} />}
      </body>
    </html>
  );
}

type AppProvidersProps = { csrfParam: string; csrfToken: string };

const AppProviders: FC<AppProvidersProps> = ({
  children,
  csrfParam,
  csrfToken,
}) => {
  return (
    <FormAuthenticityProvider {...{ csrfParam, csrfToken }}>
      <MantineProvider theme={themeOverride} withNormalizeCSS withGlobalStyles>
        <NotificationsProvider>{children}</NotificationsProvider>
      </MantineProvider>
    </FormAuthenticityProvider>
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

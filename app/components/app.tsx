import type { FC } from "react";
import { CSRFProvider } from "~/components/csrf";

import { HiUser } from "react-icons/hi";

import { Global } from "@mantine/core";
import { AppShell, Header } from "@mantine/core";
import { Box, Group } from "@mantine/core";
import { Text } from "@mantine/core";
import { Button } from "@mantine/core";
import { Badge } from "@mantine/core";
import { NotificationsProvider } from "@mantine/notifications";
import { MantineProvider } from "~/components/mantine";
import { customSx } from "~/utils/mantine";

import { ApolloProvider } from "~/components/apollo";
import { gql } from "@apollo/client";
import type { AppLayoutViewerFragment } from "~/graphql/schema.generated";

export type AppProvidersProps = { readonly csrfToken: string };

export const AppProviders: FC<AppProvidersProps> = ({
  csrfToken,
  children,
}) => {
  return (
    <CSRFProvider token={csrfToken}>
      <MantineProvider>
        <NotificationsProvider>
          <ApolloProvider>{children}</ApolloProvider>
        </NotificationsProvider>
        <Global
          styles={({ colors }) => ({ body: { background: colors.dark[8] } })}
        />
      </MantineProvider>
    </CSRFProvider>
  );
};

gql`
  fragment AppLayoutViewer on User {
    id
  }
`;

export type AppLayoutProps = {
  version: string;
  viewer: AppLayoutViewerFragment | null | undefined;
};

export const AppLayout: FC<AppLayoutProps> = ({
  version,
  viewer,
  children,
}) => {
  return (
    <AppShell
      header={
        <Header
          height={44}
          sx={({ colors }) => ({
            background: colors.dark[9],
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
            <Group position="left" sx={{ flex: 1 }}>
              <Badge
                size="md"
                variant="outline"
                sx={{ textTransform: "unset" }}
              >
                v{version}
              </Badge>
            </Group>
            <Box>
              <Text
                component="a"
                href="/"
                size="md"
                weight={800}
                sx={customSx(({ colors, letterSpacing, transition }) => ({
                  letterSpacing: letterSpacing.widest,
                  transition,
                  transitionProperty: "color",
                  "&:hover": {
                    color: colors.gray[4],
                  },
                }))}
              >
                CHALMERS PROJECT
              </Text>
            </Box>
            <Group position="right" sx={{ flex: 1 }}>
              <Button
                component="a"
                href={viewer ? "/account" : "/account/login"}
                size="xs"
                leftIcon={<HiUser />}
                variant="outline"
                radius="xl"
                uppercase
                styles={{
                  root: { padding: "0 8px", height: 24, fontWeight: 700 },
                }}
              >
                {viewer ? "Account" : "Login"}
              </Button>
            </Group>
          </Group>
        </Header>
      }
    >
      {children}
    </AppShell>
  );
};

import type { FC } from "react";
import { useMemo } from "react";

import type { Errors } from "~/utils/errors";
import { formatError } from "~/utils/errors";

import { Container, Group } from "@mantine/core";
import { Text } from "@mantine/core";
import { Alert } from "@mantine/core";

export const NotFound: FC = () => (
  <Container size="xs">
    <Group direction="column" align="stretch" spacing={2}>
      <Text>This route doesn&apos;t exist, sorry!</Text>
      <Text component="a" href="/" variant="link">
        Let&apos;s go back home.
      </Text>
    </Group>
  </Container>
);

export type UnexpectedProps = {
  readonly error: Error | Errors;
};

const renderError = (error: Error) => {
  const message = formatError(error);
  return <Text>{message}</Text>;
};

export const Unexpected: FC<UnexpectedProps> = ({ error }) => {
  const errors = useMemo<Errors>(
    () => (Array.isArray(error) ? error : [error]),
    [error],
  );
  return (
    <Container size="xs">
      <Group direction="column" align="stretch" spacing="xs">
        {errors.length === 0 && (
          <Text color="dimmed">An unknown failure occurred.</Text>
        )}
        {errors.length === 1 && (
          <Text color="dimmed">An unexpected error occurred.</Text>
        )}
        {errors.length > 1 && (
          <Text color="dimmed">Several unexpected errors occurred.</Text>
        )}
        {errors.map((error, index) => (
          <Alert key={index} title="Error" variant="filled" color="red">
            {renderError(error)}
          </Alert>
        ))}
      </Group>
    </Container>
  );
};

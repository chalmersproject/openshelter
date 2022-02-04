import { FC, useCallback, useMemo } from "react";
import { first } from "lodash";
import { formatError } from "~/utils/errors";

import { useCSRFContext } from "~/utils/csrf";
import { useNotifications } from "@mantine/notifications";

import { HiOutlineExclamation } from "react-icons/hi";

import type { ApolloError, ServerError } from "@apollo/client";
import { ApolloProvider as Provider } from "@apollo/client";
import { createApolloClient } from "~/graphql/apollo/client";

export const ApolloProvider: FC = ({ children }) => {
  const csrf = useCSRFContext();
  const client = useMemo(() => createApolloClient({ csrf }), [csrf]);
  return <Provider client={client}>{children}</Provider>;
};

export const formatApolloError = (error: ApolloError): string => {
  const { graphQLErrors, networkError, message } = error;
  const graphQLError = first(graphQLErrors);
  if (graphQLError) {
    return formatError(graphQLError);
  }
  if (networkError) {
    if ((networkError as ServerError | undefined)?.statusCode === 500) {
      return "An internal server error occurred.";
    }
  }
  return message;
};

export const useApolloErrorNotification = (
  title?: string,
): ((error: ApolloError) => void) => {
  const { showNotification } = useNotifications();
  return useCallback(
    error => {
      const message = formatApolloError(error);
      showNotification({
        title,
        message,
        color: "red",
        icon: <HiOutlineExclamation />,
      });
    },
    [showNotification, title],
  );
};

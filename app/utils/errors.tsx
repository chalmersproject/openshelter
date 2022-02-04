import type { GraphQLErrors } from "@apollo/client/errors";
import { GraphQLError } from "graphql";

export const Error = GraphQLError;
export type Errors = GraphQLErrors;

export function formatError({ message }: Error): string {
  const capitalized = message.charAt(0).toUpperCase() + message.slice(1);
  return capitalized + (message.endsWith(".") ? "" : ".");
}

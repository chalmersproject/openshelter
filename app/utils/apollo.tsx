import { useEffect } from "react";
import { useLoaderData } from "remix";
import { pick } from "lodash";
import { createApolloClient } from "~/graphql/apollo/client";

import { HiOutlineExclamation } from "react-icons/hi";

import type { GraphQLError } from "graphql";
import type { DocumentNode, TypedDocumentNode } from "@apollo/client";
import type { QueryOptions, ApolloQueryResult } from "@apollo/client";
import { useApolloClient } from "@apollo/client";
import { useNotifications } from "@mantine/notifications";

function serializeQueryResult<TData, TVariables>(
  result: ApolloQueryResult<TData>,
  variables?: TVariables,
): LoaderQueryResult<TData, TVariables> {
  return {
    ...pick(result, "data", "errors"),
    variables,
  };
}

// A server-side function that runs a GraphQL query and returns a serializable
// result.
export async function runLoaderQuery<T, TVariables>({
  request,
  ...options
}: LoaderQueryOptions<T, TVariables>): Promise<
  LoaderQueryResult<T, TVariables>
> {
  const client = createApolloClient({ request });
  const result = await client.query<T, TVariables>({
    ...options,
    errorPolicy: "all",
  });
  return serializeQueryResult(result, options.variables);
}

export type LoaderQueryOptions<TData, TVariables> = QueryOptions<
  TVariables,
  TData
> & {
  request: Request;
};

export type LoaderQueryResult<TData, TVariables> = Pick<
  ApolloQueryResult<TData>,
  "data" | "errors"
> & {
  variables?: TVariables;
};

export function formatQueryError({ message }: GraphQLError): string {
  const capitalized = message.charAt(0).toUpperCase() + message.slice(1);
  return capitalized + (message.endsWith(".") ? "" : ".");
}

// Like `useLoaderData`, but caches the query results.
//
// TODO: Allow customizing on-error behaviour?
export function useLoaderQuery<TData, TVariables>(
  query: DocumentNode | TypedDocumentNode,
): LoaderQueryResult<TData, TVariables> {
  const client = useApolloClient();
  const result = useLoaderData<LoaderQueryResult<TData, TVariables>>();

  // Cache results, and notify of errors.
  const { showNotification } = useNotifications();
  useEffect(() => {
    const { data, variables, errors } = result;
    client.writeQuery({ query, data, variables });
    if (errors) {
      errors.forEach(error => {
        const { path } = error;
        const title = path
          ? `Failed to load ${path.join(".")}`
          : "Failed to load route data";
        const message = formatQueryError(error);
        showNotification({
          title,
          message,
          color: "red",
          icon: <HiOutlineExclamation />,
        });
      });
    }
  }, [client, query, result]);

  return result;
}

// export function useLoaderQuery<TData, TVariables>(
//   query: DocumentNode | TypedDocumentNode,
//   options: QueryHookOptions<TData, TVariables> = {},
// ): QueryResult<TData, TVariables> {
//   const client = useApolloClient();
//   const resultFromLoader =
//     useLoaderData<LoaderQueryResult<TData, TVariables>>();

//   useEffect(() => {
//     const { data, error, variables } = resultFromLoader;
//     if (data && !error) {
//       client.writeQuery({ query, data, variables });
//     }
//   }, [client, query, resultFromLoader]);

//   const { variables, ...otherOptions } = options;
//   const result = useQuery(query, {
//     ...otherOptions,
//     variables: variables || resultFromLoader.variables,
//     skip: !!resultFromLoader.error,
//   });

//   const { called, loading } = result;
//   if (!called || loading) {
//     // Loading data from the cache happens asynchronously, in the meantime
//     // we emulate a completed result from the loader data.
//     const { data, error, variables } = resultFromLoader;
//     return {
//       ...result,
//       called: true,
//       loading: false,
//       networkStatus: error ? NetworkStatus.error : NetworkStatus.ready,
//       data,
//       error,
//       variables,
//     };
//   }
//   return result;
// }

// export type LoadedQueryResult<TData, TVariables> = Omit<
//   QueryResult<TData, TVariables>,
//   "data"
// > & { data: TData };

// // Like `useLoaderQuery`, except guarantees that the data is not null.
// //
// // Used to catch errors when rendering on the server.
// export function useLoadedQuery<TData, TVariables>(
//   query: DocumentNode | TypedDocumentNode,
//   options: QueryHookOptions<TData, TVariables> = {},
// ): LoadedQueryResult<TData, TVariables> {
//   const { data, error, ...otherFields } = useLoaderQuery<TData, TVariables>(
//     query,
//     options,
//   );
//   if (!data) {
//     if (error) {
//       throw new Error(`A loaded query returned no data: ${error.message}`);
//     } else {
//       throw new Error(`A loaded query returned no data.`);
//     }
//   }
//   return { data, error, ...otherFields };
// }

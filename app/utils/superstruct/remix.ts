import { useLoaderData as useRemixLoaderData } from "remix";
import { useActionData as useRemixActionData } from "remix";

import type { Struct } from "superstruct";
import { create } from "superstruct";

export function useLoaderData<T, S>(struct: Struct<T, S>): T {
  const data = useRemixLoaderData();
  return create(data, struct);
}

export function useActionData<T, S>(struct: Struct<T, S>): T | undefined {
  const data = useRemixActionData();
  return data ? create(data, struct) : undefined;
}

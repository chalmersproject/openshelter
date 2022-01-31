import { useEffect } from "react";

import type { LoaderFunction, ActionFunction } from "remix";
import { redirect } from "remix";
import { isRedirectResponse } from "@remix-run/react/data";

import { useLoaderData as useRemixLoaderData } from "remix";
import { useActionData as useRemixActionData } from "remix";

import { useNotifications } from "@mantine/notifications";
import { HiOutlineExclamation } from "react-icons/hi";

import type { Infer, Struct } from "superstruct";
import * as struct from "superstruct";

const ErrorStruct = struct.object({
  title: struct.optional(struct.string()),
  detail: struct.optional(struct.string()),
});

export type Result<T> = {
  data?: T;
  errors?: Infer<typeof ErrorStruct>[];
};

const createResult = <T, S>(Data: Struct<T, S>) => {
  return struct.object({
    data: struct.optional(Data),
    errors: struct.optional(struct.array(ErrorStruct)),
  });
};

function assertResult<T, S>(
  result: unknown,
  Data: Struct<T, S>,
): {
  data?: T;
  errors?: Infer<typeof ErrorStruct>[];
} {
  const Result = createResult(Data);
  return Result.mask(result);
}

function useResultNotifications<T>(result: Result<T>, namespace: string) {
  const { showNotification } = useNotifications();
  useEffect(() => {
    const { data, errors } = result;
    if (process.env.NODE_ENV === "development" && data) {
      console.log(`[${namespace} DATA]`, { data });
    }
    if (errors) {
      console.error(`[${namespace} ERRORS]`, { errors });
      errors.forEach(({ title, detail }) => {
        showNotification({
          title: title || "Unknown ErrorStruct",
          message: detail || "An unexpected error occurred.",
          color: "red",
          icon: <HiOutlineExclamation />,
        });
      });
    }
  }, [result]);
}

export function useLoaderResult<T, S>(Data: Struct<T, S>): Result<T> {
  const resultUntyped = useRemixLoaderData();
  const result = assertResult<T, S>(resultUntyped, Data);
  useResultNotifications<T>(result, "LOADER");
  return result;
}

export function useLoaderData<T, S>(Data: Struct<T, S>): T | undefined {
  const { data } = useLoaderResult(Data);
  return data;
}

export function useLoaderDataRequired<T, S>(Data: Struct<T, S>): T | undefined {
  const resultUntyped = useRemixLoaderData();
  const { data, errors } = assertResult<T, S>(resultUntyped, Data);
  if (errors) {
    console.error(`[LOADER ERRORS]`, { errors });
    throw new Error("Failed to load data.");
  }
  if (!data) {
    throw new Error("Missing data.");
  }
  return data;
}

export function useActionResult<T, S>(Data: Struct<T, S>): Result<T> {
  const resultUntyped = useRemixActionData();
  const result = assertResult<T, S>(resultUntyped, Data);
  useResultNotifications<T>(result, "ACTION");
  return result;
}

export function useActionData<T, S>(Data: Struct<T, S>): T | undefined {
  const { data } = useActionResult(Data);
  return data;
}

export function createLoader(
  path: string,
  // options?: LoaderOptions,
): LoaderFunction {
  return ({ request }) => {
    return forward(request, config => {
      config.url.pathname = path;
      config.init.method = "GET";
      config.init.body = null;
    });
  };
}

export type ActionOptions = {
  method?: string;
};

const ACTION_METHODS = ["POST", "PATCH", "PUT", "DELETE"];

export function createAction(
  path: string,
  options?: ActionOptions,
): ActionFunction {
  return async ({ request }) => {
    const response = await forward(request, config => {
      config.url.pathname = path;
      config.init.redirect = "manual";
      if (options?.method) {
        const { method } = options;
        if (!ACTION_METHODS.includes(method)) {
          throw new Error("Invalid action method.");
        }
        config.init.method = method;
        if (method === "DELETE") {
          config.init.body = null;
        }
      } else {
        if (
          !config.init.method ||
          !ACTION_METHODS.includes(config.init.method)
        ) {
          throw new Error("Invalid action method.");
        }
      }
    });
    if (isRedirectResponse(response)) {
      const location = response.headers.get("Location");
      if (!location) {
        throw new Error("Got redirect response without location!");
      }
      return redirect(location, response);
    }
    return response;
  };
}

type ForwardConfig = {
  url: URL;
  init: RequestInit;
};

async function forward(
  request: Request,
  configure: (config: ForwardConfig) => void,
): Promise<Response> {
  const url = new URL(request.url);
  url.protocol = "http:";
  url.host = "localhost:8080";

  const searchParams = url.searchParams;
  searchParams.delete("_data");
  url.search = searchParams.toString();

  const {
    method,
    headers,
    referrer,
    referrerPolicy,
    body,
    mode,
    credentials,
    cache,
    redirect,
    integrity,
  } = request;

  const initHeaders = new Headers(headers);
  removeHopByHopHeaders(initHeaders);
  initHeaders.set("Accept", "application/json");

  const init: RequestInit = {
    method,
    headers,
    referrer,
    referrerPolicy,
    mode,
    body,
    credentials,
    cache,
    redirect,
    integrity,
  };

  const config = { url, init };
  if (configure) {
    configure(config);
  }
  return await fetch(config.url.toString(), config.init);
}

const removeHopByHopHeaders = (headers: Headers) => {
  [
    "Connection",
    "Keep-Alive",
    "Proxy-Authenticate",
    "Proxy-Authorization",
    "TE",
    "Trailers",
    "Transfer-Encoding",
    "Upgrade",
  ].forEach(name => {
    headers.delete(name);
  });
};

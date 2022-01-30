import type { LoaderFunction, ActionFunction } from "remix";
import { redirect } from "remix";
import { isRedirectResponse } from "@remix-run/react/data";

// export type LoaderOptions = {};

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
  url.host = "localhost:8000";

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
  return fetch(config.url.toString(), config.init);
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

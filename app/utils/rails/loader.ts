import type { LoaderFunction } from "remix";

import { extractCSRFHeaders } from "./csrf";

export const RAILS_URL = "http://localhost:3000";

const loader: LoaderFunction = async ({ request }) => {
  const csrfHeaders = extractCSRFHeaders(request);
  const { url } = request;
  const { pathname: path } = new URL(url);
  const response = await fetch(RAILS_URL + path, {
    headers: {
      "Content-Type": "application/json",
    },
  });
  const data = await response.json();
  return { ...data, csrfHeaders };
};

export default loader;

import { renderToString } from "react-dom/server";
import { RemixServer } from "remix";
import type { EntryContext } from "remix";
import { injectStylesIntoStaticMarkup } from "@mantine/ssr";

export default async function handleRequest(
  request: Request,
  responseStatusCode: number,
  responseHeaders: Headers,
  remixContext: EntryContext,
) {
  // Create markup.
  const markupPlain = renderToString(
    <RemixServer context={remixContext} url={request.url} />,
  );

  // Style markup (with Mantine).
  const markup = injectStylesIntoStaticMarkup(markupPlain);

  // Create response.
  responseHeaders.set("Content-Type", "text/html");
  return new Response("<!DOCTYPE html>" + markup, {
    status: responseStatusCode,
    headers: responseHeaders,
  });
}

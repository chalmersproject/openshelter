import { renderToString } from "react-dom/server";
import { RemixServer } from "remix";
import type { EntryContext } from "remix";
import { injectStylesIntoStaticMarkup } from "@mantine/ssr";

export default function handleRequest(
  request: Request,
  responseStatusCode: number,
  responseHeaders: Headers,
  remixContext: EntryContext,
) {
  // Create markup.
  const markupWithoutStyles = renderToString(
    <RemixServer context={remixContext} url={request.url} />,
  );
  const markup = injectStylesIntoStaticMarkup(markupWithoutStyles);

  // Create response.
  responseHeaders.set("Content-Type", "text/html");
  return new Response("<!DOCTYPE html>" + markup, {
    status: responseStatusCode,
    headers: responseHeaders,
  });
}

import type { TurboFrameMissingEvent } from "@hotwired/turbo";
import "@hotwired/turbo-rails";
import invariant from "tiny-invariant";

// Handle server errors from Turbo frames.
document.addEventListener("turbo:frame-missing", async event => {
  invariant(event instanceof CustomEvent);
  const { fetchResponse } = (event as TurboFrameMissingEvent).detail;
  const { responseHTML, serverError, statusCode, redirected } = fetchResponse;
  if (serverError) {
    event.preventDefault();
    Turbo.visit(window.location.href, {
      response: { responseHTML: await responseHTML, statusCode, redirected },
      action: "replace",
    });
  }
});

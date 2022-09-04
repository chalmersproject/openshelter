import { isDebugTarget, meta, resolve } from "app/javascript/helpers";

import Honeybadger from "@honeybadger-io/js";

import pick from "lodash/pick";
import omitBy from "lodash/omitBy";
import isNil from "lodash/isNil";

window.Honeybadger = Honeybadger;

const apiKey = meta("honeybadger-api-key");
if (apiKey) {
  const environment = meta("env");
  const revision = meta("honeybadger-revision");
  const debug = isDebugTarget("honeybadger");
  Honeybadger.configure({
    apiKey,
    environment,
    revision,
    debug,
    enableUnhandledRejection: false,
  });
  const config = pick(
    Honeybadger.config,
    "environment",
    "revision",
    "filters",
    "debug",
  );
  console.info("Initialized Honeybadger", omitBy(config, isNil));

  const context = resolve(() => {
    const jsonString = meta("honeybadger-context");
    if (jsonString) {
      return JSON.parse(jsonString);
    }
  });
  if (context) {
    Honeybadger.setContext(context);
    console.info("Set Honeybadger context", context);
  }
} else {
  console.warn("Missing Honeybadger API key; skipping initialization");
}

import { Application } from "@hotwired/stimulus";
import { isDebugTarget } from "app/javascript/helpers";

import Honeybadger from "@honeybadger-io/js";

import pick from "lodash/pick";

// Initialize application
const application = Application.start();

// Configure development mode
application.debug = isDebugTarget("stimulus");
application.stimulusUseDebug = application.debug;
window.Stimulus = application;
console.info("Initialized Stimulus", pick(application, "debug"));

// Report errors to Honeybadger
application.handleError = (error, message, detail) => {
  console.warn(`[Stimulus] ${message}`, detail);
  if (Honeybadger.config.apiKey) {
    Honeybadger.notify(error);
  }
};

export default application;

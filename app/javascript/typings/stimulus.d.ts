import type { Application } from "@hotwired/stimulus";

declare global {
  const Stimulus: Application;

  interface Window {
    Stimulus: Application;
  }
}

declare module "@hotwired/stimulus" {
  class Application {
    stimulusUseDebug: boolean;
  }
}

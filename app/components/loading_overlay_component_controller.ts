import { ApplicationController } from "app/javascript/controllers";

import type { TransitionController } from "stimulus-use";
import { useTransition } from "stimulus-use";

interface LoadingOverlayComponent
  extends Pick<TransitionController, "enter" | "leave"> {
  readonly overlayTarget?: HTMLElement;
  loadingValue?: boolean;
  transitioned: boolean;
}

// Connects to data-controller="loading-overlay-component"
class LoadingOverlayComponent extends ApplicationController {
  static targets = ["overlay"];
  static values = {
    loading: Boolean,
  };

  connect() {
    requestAnimationFrame(() => {
      useTransition(this, {
        element: this.overlayTarget,
        enterActive: "opacity-100 pointer-events-none",
        leaveActive: "opacity-0 pointer-events-none",
        leaveTo: "hidden",
        transitioned: this.loadingValue,
      });
    });
  }

  toggle() {
    if (this.loadingValue) {
      this.stop();
    } else {
      this.start();
    }
  }

  start() {
    if (!this.loadingValue && this.enter) {
      this.enter(undefined);
      this.loadingValue = true;
    }
  }

  stop(event?: Event) {
    if (this.loadingValue && this.leave) {
      this.leave(event);
      this.loadingValue = false;
    }
  }
}

export default LoadingOverlayComponent;

import { ApplicationController } from "app/javascript/controllers";

import type { TransitionController } from "stimulus-use";
import { useTransition } from "stimulus-use";

interface FlashController {
  transitioned: boolean;
}

// Connects to data-controller="flash"
class FlashController extends ApplicationController {
  transitionController(): TransitionController {
    return this as unknown as TransitionController;
  }

  connect() {
    useTransition(this, {
      leaveActive: "transition-all duration-[4000ms]",
      leaveFrom: "max-h-44",
      leaveTo: "max-h-0",
      transitioned: true,
    });
    setTimeout(() => {
      this.transitionController().leave!(undefined);
    }, 500);
  }
}

export default FlashController;

// @ts-ignore
import RevealController from "stimulus-reveal-controller";

// Connects to data-controller="reveal-once"
export default class extends RevealController {
  show(event: Event) {
    super.show();
    if (event.target instanceof HTMLElement) {
      event.target.classList.add("hidden");
    }
  }
}

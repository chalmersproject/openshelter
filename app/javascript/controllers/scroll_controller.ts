import { ApplicationController } from "app/javascript/controllers";
import { scrollIntoView } from "app/javascript/helpers";

interface ScrollController {
  marginValue: number;
}

// Connects to data-controller="scroll"
class ScrollController extends ApplicationController {
  static values = {
    margin: {
      type: Number,
      default: 10,
    },
  };

  get autoscroll(): boolean {
    const firstAutoscrollElement = document.querySelector(
      `[data-controller~="scroll"][data-autoscroll]`,
    );
    return this.element === firstAutoscrollElement;
  }

  initialize() {
    this.scrollIntoView = this.scrollIntoView.bind(this);
  }

  connect() {
    if (this.autoscroll) {
      requestAnimationFrame(() => {
        this.scrollIntoView();
      });
    }
  }

  scrollIntoView(event?: Event) {
    if (!event || event.target === this.element) {
      scrollIntoView(this.element, { margin: this.marginValue });
    }
  }
}

export default ScrollController;

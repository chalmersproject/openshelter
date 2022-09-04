// @ts-ignore
import ReadMoreController from "stimulus-read-more";
import invariant from "tiny-invariant";

interface ShowMoreController {
  readonly contentTarget?: HTMLElement;
  readonly triggerTarget?: HTMLElement;
}

// Connects to data-controller="show-more"
class ShowMoreController extends ReadMoreController {
  static targets = [...super.targets, "trigger"];

  connect() {
    super.connect();

    invariant(this.contentTarget, "missing content");
    invariant(this.triggerTarget, "missing trigger");

    // Automatically disable expanding if content is small enough.
    const contentContainer = this.contentTarget.firstElementChild!;
    const contentContainerStyle = getComputedStyle(contentContainer);
    const content = contentContainer.firstElementChild!;
    const contentStyle = getComputedStyle(content);
    const contentHeight = parseInt(contentStyle.height);
    const contentMaxHeight = parseInt(contentContainerStyle.maxHeight);
    if (contentHeight <= contentMaxHeight) {
      this.triggerTarget.click();
      this.triggerTarget.classList.add("hidden");
    }
  }

  triggerTargetConnected(target: HTMLElement) {
    target.addEventListener("click", this.toggle.bind(this));
  }

  triggerTargetDisconnected(target: HTMLElement) {
    target.removeEventListener("click", this.toggle.bind(this));
  }

  toggle(event: Event): void {
    super.toggle(event);
  }
}

export default ShowMoreController;

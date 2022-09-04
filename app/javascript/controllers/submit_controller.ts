import { ApplicationController } from "app/javascript/controllers";
import { useDebounce } from "stimulus-use";
import invariant from "tiny-invariant";

// Connects to data-controller="submit"
class SubmitController extends ApplicationController {
  static debounces = ["request"];

  get element(): HTMLFormElement {
    invariant(
      super.element instanceof HTMLFormElement,
      "element must be a form",
    );
    return super.element;
  }

  get submitTarget(): HTMLInputElement | HTMLButtonElement {
    const target = this.element.querySelector("[type=submit]");
    invariant(
      target instanceof HTMLInputElement || target instanceof HTMLButtonElement,
    );
    return target;
  }

  get autodisable(): boolean {
    return this.element.dataset["autodisable"] !== undefined;
  }

  get autosubmit(): boolean {
    return this.element.dataset["autosubmit"] !== undefined;
  }

  initialize() {
    this.enable = this.enable.bind(this);
    this.request = this.request.bind(this);
    useDebounce(this, {});
  }

  connect() {
    if (this.autosubmit) {
      this.request();
    }
    if (this.autodisable) {
      this.submitTarget.disabled = true;
      this.element.addEventListener("change", this.enable);
      this.element.addEventListener("input", this.enable);
    }
  }

  disconnect() {
    if (this.autodisable) {
      this.element.removeEventListener("change", this.enable);
      this.element.removeEventListener("input", this.enable);
    }
  }

  enable() {
    this.submitTarget.disabled = false;
    if (this.autodisable) {
      this.element.removeEventListener("change", this.enable);
      this.element.removeEventListener("input", this.enable);
    }
  }

  request() {
    this.element.requestSubmit();
  }
}

export default SubmitController;

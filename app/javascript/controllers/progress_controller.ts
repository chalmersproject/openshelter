import { ApplicationController } from "app/javascript/controllers";
import invariant from "tiny-invariant";

// Connects to data-controller="progress"
export default class extends ApplicationController {
  get turboAdapter(): any {
    return Turbo.navigator.delegate.adapter;
  }

  initialize() {
    this.beforeFetchRequest = this.beforeFetchRequest.bind(this);
    this.beforeFetchResponse = this.beforeFetchResponse.bind(this);
  }

  connect() {
    this.element.addEventListener(
      "turbo:before-fetch-request",
      this.beforeFetchRequest,
    );
    this.element.addEventListener(
      "turbo:before-fetch-response",
      this.beforeFetchResponse,
    );
  }

  disconnect() {
    this.element.removeEventListener(
      "turbo:before-fetch-request",
      this.beforeFetchRequest,
    );
    this.element.removeEventListener(
      "turbo:before-fetch-response",
      this.beforeFetchResponse,
    );
  }

  show(event?: CustomEvent) {
    const { showProgressBar, progressBar } = this.turboAdapter;
    if (showProgressBar && progressBar) {
      showProgressBar();
      this.dispatch("show", event?.detail);
    }
  }

  hide(event?: CustomEvent) {
    const { showProgressBar, progressBar } = this.turboAdapter;
    if (showProgressBar && progressBar) {
      progressBar.hide();
      this.dispatch("hide", event?.detail);
    }
  }

  beforeFetchRequest(event: Event) {
    invariant(event instanceof CustomEvent);
    if (event.target === this.element) {
      this.show(event);
    }
  }

  beforeFetchResponse(event: Event) {
    invariant(event instanceof CustomEvent);
    if (event.target === this.element) {
      this.hide(event);
    }
  }
}

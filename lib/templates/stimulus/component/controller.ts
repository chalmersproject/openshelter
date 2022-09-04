import { ApplicationController } from "app/javascript/controllers";

// Connects to data-controller="<%= @attribute %>"
export default class extends ApplicationController {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }
}

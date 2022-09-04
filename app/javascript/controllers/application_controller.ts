import { ApplicationController } from "stimulus-use";
import invariant from "tiny-invariant";

export default class extends ApplicationController {
  get element(): HTMLElement {
    invariant(super.element instanceof HTMLElement);
    return super.element;
  }
}

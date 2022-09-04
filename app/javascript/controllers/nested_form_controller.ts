import { ApplicationController } from "app/javascript/controllers";
import invariant from "tiny-invariant";

interface NestedFormController {
  readonly targetTarget?: HTMLElement;
  readonly itemTemplateTarget?: HTMLElement;
  readonly emptyTemplateTarget?: HTMLElement;

  requiredValue?: boolean;
  itemSelectorValue?: string;
  emptySelectorValue?: string;

  hasEmptyTemplateTarget: boolean;
}

class NestedFormController extends ApplicationController {
  static targets = ["target", "itemTemplate", "emptyTemplate"];
  static values = {
    required: {
      type: Boolean,
      default: false,
    },
    itemSelector: {
      type: String,
      default: ".nested-form-item",
    },
    emptySelector: {
      type: String,
      default: ".nested-form-empty",
    },
  };

  add(event: Event) {
    event.preventDefault();

    invariant(this.targetTarget, "missing target");
    invariant(this.itemTemplateTarget, "missing item template");
    invariant(this.itemSelectorValue, "missing item selector");
    invariant(this.emptySelectorValue, "missing empty selector");

    // Create item from template.
    const itemHTML: string = this.itemTemplateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime().toString(),
    );
    this.targetTarget.insertAdjacentHTML("beforebegin", itemHTML);

    const item = this.targetTarget.previousElementSibling;
    invariant(item, "missing inserted item");

    const input = item.querySelector("input, textarea");
    invariant(
      input instanceof HTMLInputElement || input instanceof HTMLTextAreaElement,
    );
    if (input) {
      input.focus();
    }

    // Remove empty element.
    const empty = this.element.querySelector(this.emptySelectorValue);
    if (empty) {
      empty.remove();
    }
  }

  remove(event: Event) {
    invariant(event.currentTarget instanceof HTMLElement);
    invariant(this.targetTarget, "missing target");
    invariant(this.itemSelectorValue, "missing item selector");
    invariant(this.emptySelectorValue, "missing empty selector");

    // Remove item from target.
    const items = this.element.querySelectorAll(this.itemSelectorValue);
    if (this.requiredValue) {
      if (items.length === 1) {
        return;
      }
    }

    const item = event.currentTarget.closest(this.itemSelectorValue);
    invariant(item instanceof HTMLElement);
    item.remove();

    // Add empty element.
    if (this.hasEmptyTemplateTarget && items.length === 1) {
      invariant(this.emptyTemplateTarget);
      const emptyHTML = this.emptyTemplateTarget.innerHTML;
      this.targetTarget.insertAdjacentHTML("beforebegin", emptyHTML);
    }
  }
}

export default NestedFormController;

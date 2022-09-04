import { context, register } from "app/javascript/alpine/helpers";
import invariant from "tiny-invariant";

type TagsInputComponentParams = {
  readonly tags?: string[];
};

const TagsInputComponentData = ({ tags }: TagsInputComponentParams) => ({
  // == State ==
  tags: tags || [],
  value: "",

  // == Elements ==
  get input(): HTMLInputElement {
    const input = context(this).$refs.input;
    invariant(input instanceof HTMLInputElement);
    return input;
  },

  // == Methods ==
  add() {
    if (this.input.reportValidity()) {
      const tag = this.value.trim();
      if (!this.tags.includes(tag)) {
        this.tags.push(tag);
      }
      this.clear();
    }
  },

  clear() {
    this.value = "";
  },
});

register("TagsInputComponent", TagsInputComponentData);

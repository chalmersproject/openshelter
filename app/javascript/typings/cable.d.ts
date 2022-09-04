import type _Cable from "@rails/actioncable";

declare global {
  const Cable: typeof _Cable;

  interface Window {
    Cable: typeof _Cable;
  }
}

import type _Turbo from "@hotwired/turbo";

declare global {
  const Turbo: typeof _Turbo;

  interface Window {
    Turbo: typeof _Turbo;
  }
}

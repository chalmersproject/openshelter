import type { Alpine as _Alpine } from "alpinejs";

declare global {
  const Alpine: _Alpine;

  interface Window {
    Alpine: _Alpine;
  }
}

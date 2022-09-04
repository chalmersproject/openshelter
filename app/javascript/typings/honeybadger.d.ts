import type _Honeybadger from "@honeybadger-io/js";

declare global {
  const Honeybadger: typeof _Honeybadger;

  interface Window {
    Honeybadger: typeof _Honeybadger;
  }
}

import type _FS from "@fullstory/browser";

declare global {
  const FS: typeof _FS;

  interface Window {
    FS: typeof _FS;
  }
}

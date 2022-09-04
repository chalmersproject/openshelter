declare module "trix";

declare global {
  const Trix;

  interface Window {
    Trix: any;
  }
}

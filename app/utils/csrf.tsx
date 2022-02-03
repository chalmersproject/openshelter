import { createContext, useContext } from "react";

export type CSRFContext = {
  readonly param: string;
  readonly token: string;
};

export const CSRFContext = createContext<CSRFContext | null>(null);

export const useCSRFContext = (): CSRFContext => {
  const context = useContext(CSRFContext);
  if (!context) {
    throw new Error("Missing CSRF context.");
  }
  return context;
};

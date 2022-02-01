import { FC, createContext, useContext, useMemo } from "react";

export type CSRFContext = {
  readonly param: string;
  readonly token: string;
};

const CSRFContext = createContext<CSRFContext | null>(null);

export const useCSRFContext = (): CSRFContext => {
  const context = useContext(CSRFContext);
  if (!context) {
    throw new Error("Missing CSRF context.");
  }
  return context;
};

export type CSRFProviderProps = {
  readonly csrf: Record<string, string>;
};

export const CSRFProvider: FC<CSRFProviderProps> = ({ csrf, children }) => {
  const [[param, token]] = useMemo(() => Object.entries(csrf), [csrf]);
  const value: CSRFContext = { param, token };
  return <CSRFContext.Provider value={value}>{children}</CSRFContext.Provider>;
};

export const CSRFMeta: FC = () => {
  const { param, token } = useCSRFContext();
  return (
    <>
      <meta name="csrf-param" content={param} />
      <meta name="csrf-token" content={token} />
    </>
  );
};

export const FormAuthenticityField: FC = () => {
  const { param, token } = useCSRFContext();
  return <input type="hidden" name={param} value={token} />;
};

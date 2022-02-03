import { FC, useMemo } from "react";
import { CSRFContext, useCSRFContext } from "~/utils/csrf";

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

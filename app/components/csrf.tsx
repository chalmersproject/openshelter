import { FC } from "react";
import { CSRFContext, useCSRFContext } from "~/utils/csrf";

export type CSRFProviderProps = {
  readonly token: string;
};

export const CSRFProvider: FC<CSRFProviderProps> = ({ token, children }) => {
  const value: CSRFContext = { token };
  return <CSRFContext.Provider value={value}>{children}</CSRFContext.Provider>;
};

export const CSRFMeta: FC = () => {
  const { token } = useCSRFContext();
  return (
    <>
      <meta name="csrf-param" content="form_authenticity_token" />
      <meta name="csrf-token" content={token} />
    </>
  );
};

export const FormAuthenticityField: FC = () => {
  const { token } = useCSRFContext();
  return <input type="hidden" name="form_authenticity_token" value={token} />;
};

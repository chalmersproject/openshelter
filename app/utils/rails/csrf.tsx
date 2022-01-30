import { FC, createContext, useContext } from "react";

export type CSRFMetaProps = {
  readonly csrfParam: string;
  readonly csrfToken: string;
};

export const CSRFMeta: FC<CSRFMetaProps> = ({ csrfParam, csrfToken }) => {
  return (
    <>
      <meta name="csrf-param" content={csrfParam} />
      <meta name="csrf-token" content={csrfToken} />
    </>
  );
};

type FormAuthenticityAttributes = {
  readonly name: string;
  readonly value: string;
};

const FormAuthenticityContext =
  createContext<FormAuthenticityAttributes | null>(null);

export type FormAuthenticityProviderProps = {
  readonly csrfParam: string;
  readonly csrfToken: string;
};

export const FormAuthenticityProvider: FC<FormAuthenticityProviderProps> = ({
  csrfParam,
  csrfToken,
  children,
}) => {
  const value: FormAuthenticityAttributes = {
    name: csrfParam,
    value: csrfToken,
  };
  return (
    <FormAuthenticityContext.Provider value={value}>
      {children}
    </FormAuthenticityContext.Provider>
  );
};

export const FormAuthenticityField: FC = () => {
  const data = useContext(FormAuthenticityContext);
  if (!data) {
    throw new Error("Missing form authenticity attributes.");
  }
  return <input type="hidden" {...data} />;
};

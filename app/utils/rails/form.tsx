import type { FC } from "react";
import { Form as RemixForm } from "remix";
import type { FormProps as RemixFormProps } from "remix";

import { CSRFHeaders } from "./csrf";

export type FormProps = RemixFormProps & {
  readonly csrfHeaders: CSRFHeaders;
};

const Form: FC<FormProps> = ({
  csrfHeaders,
  method = "post",
  children,
  ...otherProps
}) => {
  return (
    <RemixForm {...{ method }} {...otherProps}>
      {children}
      <input type="hidden" name={csrfHeaders.param} value={csrfHeaders.token} />
    </RemixForm>
  );
};

export default Form;

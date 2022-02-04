import type { FC } from "react";
import { MantineProvider as Provider } from "@mantine/core";

import theme from "~/theme";

export const MantineProvider: FC = ({ children }) => (
  <Provider
    theme={theme}
    styles={{
      Button: {
        leftIcon: {
          marginRight: 5,
        },
        rightIcon: {
          marginLeft: 5,
        },
      },
    }}
    withNormalizeCSS
    withGlobalStyles
  >
    {children}
  </Provider>
);

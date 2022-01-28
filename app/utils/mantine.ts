import type { MantineThemeOverride, Tuple } from "@mantine/core";
import type { TailwindColorGroup } from "tailwindcss/tailwind-config";

import {
  zinc,
  slate,
  red,
  pink,
  fuchsia,
  violet,
  indigo,
  blue,
  cyan,
  teal,
  green,
  lime,
  yellow,
  orange,
} from "tailwindcss/colors";

function tailwindColor(color: TailwindColorGroup): Tuple<string, 10> {
  return Object.values(color) as Tuple<string, 10>;
}

export const themeOverride: MantineThemeOverride = {
  primaryColor: "indigo",
  fontFamily:
    'Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"',
  colors: {
    dark: tailwindColor(zinc),
    gray: tailwindColor(slate),
    red: tailwindColor(red),
    pink: tailwindColor(pink),
    grape: tailwindColor(fuchsia),
    violet: tailwindColor(violet),
    indigo: tailwindColor(indigo),
    blue: tailwindColor(blue),
    cyan: tailwindColor(cyan),
    teal: tailwindColor(teal),
    green: tailwindColor(green),
    lime: tailwindColor(lime),
    yellow: tailwindColor(yellow),
    orange: tailwindColor(orange),
  },
};

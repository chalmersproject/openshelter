import type { MantineTheme, MantineThemeOverride } from "@mantine/core";
import type { CSSObject, Tuple } from "@mantine/core";

import type {
  TailwindColorGroup,
  TailwindValues,
} from "tailwindcss/tailwind-config";

// import resolveTailwindConfig from "tailwindcss/resolveConfig";
import { letterSpacing } from "tailwindcss/defaultTheme";

// console.log({
//   transitionDelay,
//   transitionDuration,
//   transitionProperty,
//   transitionTimingFunction,
// });

import {
  // zinc,
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

const themeOther = {
  letterSpacing: letterSpacing as TailwindValues,
  transition: "all 150ms cubic-bezier(0.4, 0, 0.2, 1)",
  transitionProperties:
    "color, background-color, border-color, text-decoration-color, fill, " +
    "stroke",
};

type MantineThemeOther = typeof themeOther;

export const theme: MantineThemeOverride = {
  primaryColor: "green",
  colorScheme: "dark",
  colors: {
    // dark: tailwindColor(zinc),
    // gray: tailwindColor(slate),
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
  fontFamily:
    'Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"',
  other: themeOther,
};

type CustomTheme = Omit<MantineTheme, "other"> & MantineThemeOther;

export function customTheme({ other, ...theme }: MantineTheme): CustomTheme {
  return { ...theme, ...(other as MantineThemeOther) };
}

export function customSx(
  fn: (theme: CustomTheme) => CSSObject,
): (theme: MantineTheme) => CSSObject {
  return theme => fn(customTheme(theme));
}

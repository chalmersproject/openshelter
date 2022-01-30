import type { MantineTheme, MantineThemeOverride } from "@mantine/core";
import type { CSSObject, Tuple } from "@mantine/core";

import type {
  TailwindColorGroup,
  TailwindValues,
} from "tailwindcss/tailwind-config";

// import resolveTailwindConfig from "tailwindcss/resolveConfig";
import { letterSpacing } from "tailwindcss/defaultTheme";

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

const themeOther = { letterSpacing };
type TailwindValuesify<T> = {
  [P in keyof T]: TailwindValues;
};
type MantineThemeOther = TailwindValuesify<typeof themeOther>;

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
  other: themeOther,
};

type CustomTheme = Omit<MantineTheme, "other"> & MantineThemeOther;

export function customTheme({ other, ...theme }: MantineTheme): CustomTheme {
  return { ...theme, ...(other as MantineThemeOther) };
}

export function sx(
  fn: (theme: CustomTheme) => CSSObject,
): (theme: MantineTheme) => CSSObject {
  return theme => fn(customTheme(theme));
}

// export type MantineThemeOtherCustom = Pick<
//   TailwindTheme,
//   "letterSpacing" | "aspectRatio"
// >;

// declare module "@mantine/styles/lib/theme/types/MantineTheme" {
//   export interface MantineTheme {
//     other: MantineThemeOtherCustom;
//   }
// }

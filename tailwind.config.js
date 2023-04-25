const plugin = require("tailwindcss/plugin");
const defaultTheme = require("tailwindcss/defaultTheme");
const defaultConfig = require("tailwindcss/defaultConfig");

module.exports = {
  presets: [defaultConfig],
  content: [
    "./app/inputs/**/*.rb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{html,html.erb}",
    "./app/components/**/*.{rb,html,html.erb,ts}",
    "./test/components/**/*.rb",
  ],
  safelist: ["hidden"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: ({ theme: { colors } }) => ({
        primary: colors.amber,
        secondary: colors.lime,
      }),
      maxHeight: defaultTheme.height,
      minHeight: defaultTheme.height,
      maxWidth: defaultTheme.width,
      minWidth: defaultTheme.width,
      transitionTimingFunction: {
        "expo-out": "cubic-bezier(0.16, 1, 0.3, 1)",
        "expo-in": "cubic-bezier(0.87, 0, 0.13, 1)",
        "expo-in-out": "cubic-bezier(0.16, 1, 0.3, 1)",
      },
      typography: ({ theme }) => ({
        DEFAULT: {
          css: {
            lineHeight: theme("lineHeight.normal"),
            blockquote: {
              marginTop: theme("spacing.2"),
            },
          },
        },
      }),
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
    require("tailwind-scrollbar")({ nocompatible: true }),
    plugin(({ addVariant }) => {
      addVariant("cloak", "&[x-cloak]");
    }),
  ],
  important: "#root",
  darkMode: "class",
};

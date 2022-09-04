const minimist = require("minimist");
const dotenv = require("dotenv");
const path = require("path");
const browserslist = require("browserslist");

const esbuild = require("esbuild");
const esbuildRailsPlugin = require("esbuild-rails");
const esbuildBrowserslistPlugin =
  require("esbuild-plugin-browserslist").esbuildPluginBrowserslist;

// Parse CLI arguments.
const { minify, watch } = minimist(process.argv);

// Define entry points.
const entryPoints = ["application.ts"];

// Set environment.
dotenv.config();

// Build scripts, and output to app/assets/builds.
esbuild
  .build({
    entryPoints: entryPoints.map(name =>
      path.join(process.cwd(), `app/javascript/${name}`),
    ),
    define: {
      global: "window",
    },
    bundle: true,
    minify,
    sourcemap: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    loader: {
      ".png": "file",
      ".jpg": "file",
      ".svg": "file",
      ".woff": "file",
      ".woff2": "file",
      ".ttf": "file",
      ".eot": "file",
    },
    watch,
    plugins: [
      esbuildRailsPlugin(),
      esbuildBrowserslistPlugin(browserslist(), { printUnknownTargets: false }),
    ],
  })
  .catch(() => process.exit(1));

import { isDebugTarget, meta, resolve } from "app/javascript/helpers";
import * as FS from "@fullstory/browser";

import omitBy from "lodash/omitBy";
import isNil from "lodash/isNil";

const orgId = meta("fullstory-org-id");
if (orgId) {
  const devMode = meta("env") === "development";
  const debug = isDebugTarget("fullstory");
  const identity = resolve(() => {
    const jsonString = meta("fullstory-identity");
    if (jsonString) {
      return JSON.parse(jsonString) as {
        uid: string;
        email: string;
        displayName: string;
      };
    }
  });
  FS.init({ orgId, devMode, debug }, () => {
    if (identity) {
      const { uid, ...customVars } = identity;
      FS.identify(uid, customVars);
    }
  });
  console.info(
    `Initialized FullStory`,
    omitBy({ orgId, identity, devMode }, isNil),
  );
} else {
  console.warn("Missing FullStory missing org ID; skipping initialization)");
}

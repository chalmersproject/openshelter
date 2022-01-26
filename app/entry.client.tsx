import { hydrate } from "react-dom";
import { RemixBrowser } from "remix";
import * as Rails from "@rails/ujs";

hydrate(<RemixBrowser />, document);
Rails.start();

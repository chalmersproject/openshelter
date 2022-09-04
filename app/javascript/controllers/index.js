import application from "./application";
import ApplicationController from "./application_controller";

import CarouselController from "stimulus-carousel";
import DropdownController from "stimulus-dropdown";
import ReadMoreController from "stimulus-read-more";
import RevealController from "stimulus-reveal-controller";
import TextareaAutogrowController from "stimulus-textarea-autogrow";

application.register("carousel", CarouselController);
application.register("dropdown", DropdownController);
application.register("read-more", ReadMoreController);
application.register("reveal", RevealController);
application.register("textarea-autogrow", TextareaAutogrowController);

import { ClickOutsideController } from "stimulus-use";
import { HoverController } from "stimulus-use";
import { TransitionController } from "stimulus-use";
import { IdleController } from "stimulus-use";
import { WindowFocusController } from "stimulus-use";
import { WindowResizeController } from "stimulus-use";

application.register("click-outside", ClickOutsideController);
application.register("hover", HoverController);
application.register("idle", IdleController);
application.register("transition", TransitionController);
application.register("window-focus", WindowFocusController);
application.register("window-resize", WindowResizeController);

import controllers from "./**/*_controller.{js,ts}";
import componentControllers from "../../components/**/*_controller.{js,ts}";

[...controllers, ...componentControllers].forEach(({ name, module }) => {
  const matches = /^(\.\.\.--components--)?([a-z-]+)(-controller\.ts)?$/.exec(
    name,
  );
  application.register(matches[2], module.default);
});

export { ApplicationController, application };

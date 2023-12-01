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

//
// import all js and ts files from directories
// that hold controller ts/js files and compontent controller ts/js files.
//
import controllers from "./**/*_controller.{js,ts}";
import componentControllers from "../../components/**/*_controller.{js,ts}";

//
// for each imported controller and component controller, pass in their
// name and associated module into this "stimuls registeration" function.
//
[...controllers, ...componentControllers].forEach(({ name, module }) => {
  //
  // collect all real names of modules that match this regular expression
  //
  // regex = starts with ..-- or ..--..--components-- or ends with -controller.ts
  // regex contd.. ->  must match convention of words with a-z characters separated by a dash
  //
  const matches =
    /^(\.\.--)?(\.\.--components--)?([a-z-]+)(-controller\.ts)?$/.exec(name);

  //
  // finally, register the matched module with stimulus.
  //
  try {
    // console.log(matches[3]);
    application.register(matches[3], module.default);
  } catch (error) {
    console.log("something with stimulus registration broke");
    console.error(error);
  }
});

export { ApplicationController, application };

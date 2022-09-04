// @ts-ignore
import DropdownController from "stimulus-dropdown";

import type { TransitionController } from "stimulus-use";
import { useTransition } from "stimulus-use";

import type { Controller } from "@hotwired/stimulus";

interface MenuComponentController
  extends Controller,
    Required<Pick<TransitionController, "transitioned" | "enter" | "leave">> {
  readonly menuTarget?: HTMLElement;
}

// Connects to data-controller="menu-component"
class MenuComponentController extends DropdownController {
  connect() {
    useTransition(this, {
      element: this.menuTarget,
      transitioned: false,
    });
  }
}

export default MenuComponentController;

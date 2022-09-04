import { ApplicationController } from "app/javascript/controllers";
import GLightbox from "glightbox";

interface GalleryComponentController {
  expandableValue: boolean;
}

// Connects to data-controller="gallery-component"
class GalleryComponentController extends ApplicationController {
  static values = { expandable: Boolean };

  lightbox: any;

  connect() {
    if (this.expandableValue) {
      const selector = `#${this.element.id} .glightbox`;
      this.lightbox = GLightbox({ selector });
    }
  }

  disconnect() {
    if (this.lightbox) {
      this.lightbox.destroy();
    }
  }
}

export default GalleryComponentController;

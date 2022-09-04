import invariant from "tiny-invariant";
import { resolve } from "app/javascript/helpers";
import { context, register } from "app/javascript/alpine/helpers";

import Uppy, { UploadedUppyFile } from "@uppy/core";
import UppyDashboard from "@uppy/dashboard";
import UppyImageEditor from "@uppy/image-editor";
import UppyUrl from "@uppy/url";
import UppyActiveStorageUpload from "uppy-activestorage-upload";

type FileInputComponentParams = {
  readonly directUploadUrl: string;
  readonly multiple?: boolean;
  readonly attachments?: any;
};

const FileInputComponentData = ({
  directUploadUrl,
  multiple = false,
  attachments,
}: FileInputComponentParams) => ({
  // == State ==
  directUploadUrl,
  multiple,
  attachments,
});

register("FileInputComponent", FileInputComponentData);

type FileInputComponentAttachmentParams = {
  readonly attached: boolean;
};

const FileInputComponentAttachmentData = ({
  attached,
}: FileInputComponentAttachmentParams) => ({
  // == State ==
  attached,
});

register("file_input_component_attachment", FileInputComponentAttachmentData);

type FileInputComponentUppyParams = {
  readonly directUploadUrl: string;
  readonly multiple?: boolean;
};

const FileInputComponentUppyData = ({
  directUploadUrl,
  multiple = false,
}: FileInputComponentUppyParams) => ({
  // == State ==
  uppy: null as Uppy | null,

  // == Helpers ==
  handleFile({ response, data, name }: UploadedUppyFile<unknown, unknown>) {
    const signedId = resolve(() => {
      invariant(response);
      const signedId = (response as Record<string, unknown>)["signed_id"];
      invariant(typeof signedId === "string");
      return signedId;
    });
    resolve(() => {
      const reader = new FileReader();
      reader.addEventListener("loadend", () => {
        const { result } = reader;
        if (typeof result === "string") {
          context(this).$dispatch("file-input-component-uppy:complete", {
            signedId,
            filename: name,
            data: result,
          });
        }
      });
      reader.readAsDataURL(data);
    });
  },

  // == Lifecycle ==
  init() {
    context(this).$nextTick(() => {
      this.uppy = new Uppy({
        restrictions: {
          allowedFileTypes: ["image/*"],
          maxNumberOfFiles: multiple ? null : 1,
        },
      })
        .use(UppyImageEditor, {})
        .use(UppyDashboard, {
          trigger: "#" + context(this).$root.id,
          plugins: ["ImageEditor"],
          autoOpenFileEditor: !multiple,
          proudlyDisplayPoweredByUppy: false,
        })
        .use(UppyUrl, {
          target: UppyDashboard,
          companionUrl: "https://companion.uppy.io",
        })
        .use(UppyActiveStorageUpload, { directUploadUrl })
        .on("complete", ({ successful: files }) => {
          files.forEach(this.handleFile.bind(this));
        })
        .on("error", error => {
          console.error(
            "An error occurred while uploading files with Uppy:",
            error,
          );
        });
    });
  },
  destroy() {
    if (this.uppy) {
      this.uppy.close();
      this.uppy = null;
    }
  },
});

register("file_input_component_uppy", FileInputComponentUppyData);

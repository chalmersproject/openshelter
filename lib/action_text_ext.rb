# typed: false
# frozen_string_literal: true

# Extend ActionText to render PDF previews in Trix editor.
#
# See: https://github.com/rails/rails/issues/38027
module ActionText::Attachments::TrixConversion
  module Extension
    def to_trix_attachment(content = trix_attachment_content)
      attributes = full_attributes.dup
      attributes["content"] = content if content
      attributes["url"] = trix_attachable_url if previewable? &&
        preview_attachable?
      ActionText::TrixAttachment.from_attributes(attributes)
    end

    private

    def trix_attachable_url
      Rails.application.routes.url_helpers.rails_blob_url(
        preview_image.blob,
        only_path: true,
      )
    end
  end

  prepend Extension
end

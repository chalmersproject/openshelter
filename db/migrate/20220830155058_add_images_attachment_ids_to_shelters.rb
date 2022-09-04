# typed: true
# frozen_string_literal: true

class AddImagesAttachmentIdsToShelters < ActiveRecord::Migration[7.0]
  def change
    add_column :shelters,
               :images_attachment_ids,
               :string,
               array: true,
               null: false,
               default: []
  end
end

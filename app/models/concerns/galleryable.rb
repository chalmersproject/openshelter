# typed: strict
# frozen_string_literal: true

# A Galleryable has a gallery of (re)ordered set of images.
module Galleryable
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  extend ActiveSupport::Concern

  included do
    T.bind(self, T.class_of(ApplicationRecord))

    # == Dependencies ==
    requires_columns :images_attachment_ids

    # == Associations ==
    has_many_attached :images

    # == Validations ==
    validates :images,
              content_type: %r{\Aimage\/.*\z},
              size: {
                less_than_or_equal_to: 25.megabytes,
              }
    validates :images,
              limit: {
                max: 25,
              },
              unless: -> {
                T.bind(self, Galleryable)
                new_record? && try(:imported?)
              }

    # == Callbacks ==
    before_validation :set_images_attachment_ids
  end

  # == Setters ==
  sig { params(value: T.any(String, T::Enumerable[T.untyped])).void }
  def images=(value)
    super(value).tap do |changes|
      case changes
      when ActiveStorage::Attached::Changes::CreateMany
        created_ids =
          changes.attachments.map do |attachment|
            attachment = T.let(attachment, ActiveStorage::Attachment)
            attachment.id ||= SecureRandom.uuid
          end
        self[:images_attachment_ids] = created_ids
      when ActiveStorage::Attached::Changes::DeleteMany
        self[:images_attachment_ids] = []
      else
        raise "unknown changes: #{changes.inspect}"
      end
    end
  end

  # == Methods ==
  sig { returns(Integer) }
  def images_count
    ids = T.let(self[:images_attachment_ids], T::Array[Integer])
    ids.length
  end

  sig { returns(T::Array[ActiveStorage::Attachment]) }
  def images_attachments_ordered
    ids = T.let(self[:images_attachment_ids], T::Array[String])
    attachments = images.attachments
    attachments = attachments.includes(:blob) if attachments.is_a?(
      ActiveRecord::Relation,
    )
    if ids.present? && attachments.present?
      attachments.index_by(&:id).slice(*ids).values
    else
      []
    end
  end

  sig { returns(T::Array[ActiveStorage::Blob]) }
  def images_blobs_ordered
    attachment_ids = T.let(self[:images_attachment_ids], T::Array[String])
    if attachment_ids.present?
      blob_ids =
        ActiveStorage::Attachment
          .select(:id, :blob_id)
          .merge(images_attachments)
          .index_by(&:id)
          .slice(*attachment_ids)
          .values
          .map(&:blob_id)
      images_blobs.find(blob_ids).index_by(&:id).slice(*blob_ids).values
    else
      []
    end
  end

  private

  # == Callbacks ==
  sig { void }
  def set_images_attachment_ids
    relation_ids =
      (images.attachments || []).map do |attachment|
        attachment.id ||= SecureRandom.uuid
      end
    current_ids = T.let(self[:images_attachment_ids], T::Array[String])
    updated_ids =
      current_ids + (relation_ids - current_ids) - (current_ids - relation_ids)
    self[:images_attachment_ids] = updated_ids if updated_ids != current_ids
  end
end

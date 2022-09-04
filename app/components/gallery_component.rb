# typed: strict
# frozen_string_literal: true

class GalleryComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      galleryable: Galleryable,
      expandable: T::Boolean,
      limit: T.nilable(Integer),
      lazy: T::Boolean,
      kwargs: T.untyped,
    ).void
  end
  def initialize(
    galleryable:,
    expandable: true,
    limit: nil,
    lazy: false,
    **kwargs
  )
    super(**kwargs)
    @galleryable = galleryable
    @expandable = expandable
    @limit = limit
    @lazy = lazy
  end

  sig { override.returns(T::Boolean) }
  def render?
    @galleryable.images_blobs_ordered.count > 0
  end

  private

  sig { returns(T::Enumerable[ActiveStorage::Blob]) }
  def images
    images = @galleryable.images_blobs_ordered
    images = images.first(@limit) if @limit
    images.filter do |blob|
      blob.representable?.tap do |representable|
        unless representable
          Honeybadger.notify(
            "Gallery image is not representable",
            context: {
              galleryable: @galleryable.to_gid,
              image: blob.to_gid,
            },
          )
        end
      end
    end
  end

  sig { params(blob: ActiveStorage::Blob).returns(String) }
  def image_path(blob:)
    variant =
      blob.variant(
        resize_to_limit: [720, 580],
        saver: {
          strip: true,
          quality: 80,
        },
      )
    polymorphic_path(variant)
  end

  sig { returns(T::Boolean) }
  def expandable?
    @expandable
  end
end

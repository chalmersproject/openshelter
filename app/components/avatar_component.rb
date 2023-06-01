# typed: true
# frozen_string_literal: true

class AvatarComponent < ApplicationComponent
  extend T::Sig

  BORING_AVATARS_BASE_URL = "https://source.boringavatars.com"
  BORING_AVATARS_PALETTE =
    T.let(
      scoped do
        colors = %w[#FFE181 #EEE9E5 #FAD3B2 #FFBA7F #FF9C97]
        colors.map { |color| color.delete_prefix("#") }.join(",")
      end,
      String,
    )

  sig do
    params(
      profileable: T.nilable(ApplicationRecord),
      image: T.nilable(ActiveStorage::Blob),
      size: Symbol,
      kwargs: T.untyped,
    ).void
  end
  def initialize(profileable: nil, image: nil, size: :md, **kwargs)
    super(**kwargs)
    @profileable = profileable
    @image_blob = image if image
    @size = size
  end

  private

  sig { returns(Symbol) }
  attr_reader :size

  sig { returns(T.nilable(ActiveStorage::Blob)) }
  def image_blob
    return @image_blob if defined?(@image_blob)
    @image_blob = T.let(@image_blob, T.nilable(ActiveStorage::Blob))
    @image_blob =
      scoped do
        attachment =
          T.let(
            @profileable.try(:avatar_attachment),
            T.nilable(ActiveStorage::Attachment),
          )
        attachment&.blob
      end
  end

  sig { returns(T::Boolean) }
  def image?
    @profileable.present?
  end

  sig do
    returns(
      T.nilable(
        T.any(
          ActiveStorage::Variant,
          ActiveStorage::VariantWithRecord,
          ActiveStorage::Preview,
        ),
      ),
    )
  end
  def image
    return @image if defined?(@image)
    @image =
      T.let(
        @image,
        T.nilable(
          T.any(
            ActiveStorage::Variant,
            ActiveStorage::VariantWithRecord,
            ActiveStorage::Preview,
          ),
        ),
      )
    @image =
      image_blob.try! do |blob|
        blob = T.let(blob, ActiveStorage::Blob)
        if blob.representable?
          blob.representation(
            resize_to_limit: [256, 256],
            saver: {
              strip: true,
              quality: 80,
            },
          )
        else
          @profileable = T.must(@profileable)
          Honeybadger.notify(
            "Avatar is not representable",
            context: {
              profileable: @profileable.to_gid,
              image: blob.to_gid,
            },
          )
        end
      end
  end

  sig { returns(T.nilable(String)) }
  def image_src
    if @profileable
      image = self.image
      if image
        polymorphic_path(image)
      else
        type = @profileable.is_a?(User) ? "beam" : "bauhaus"
        id = T.let(@profileable.try(:short_id) || @profileable.id, String)
        url = Addressable::URI.parse(BORING_AVATARS_BASE_URL)
        url.path = "/#{type}/256/#{id}"
        url.query_values = { "colors" => BORING_AVATARS_PALETTE }
        url.to_s
      end
    end
  end
end

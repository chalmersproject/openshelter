# typed: true
# frozen_string_literal: true

class GalleryFrame < ApplicationFrame
  extend T::Sig

  sig do
    params(
      id: T.nilable(String),
      galleryable: T.nilable(T.all(ApplicationRecord, Galleryable)),
      options: Options,
    ).void
  end
  def initialize(id: nil, galleryable: nil, options: {})
    super
    @galleryable = galleryable
  end

  # == Resources ==
  sig { returns(T.nilable(T.all(ApplicationRecord, Galleryable))) }
  attr_accessor :galleryable

  after_initialization do
    self.galleryable_gid = galleryable.to_gid.to_s if galleryable.present?
  end

  # == Attributes ==
  attribute :galleryable_gid, :string
  attribute :expandable, :boolean
  attribute :limit, :integer

  # == Validations ==
  validates :galleryable_gid, presence: true

  # == Methods ==
  sig { override.returns(ApplicationComponent) }
  def to_component
    validate!
    galleryable = GlobalID::Locator.locate(galleryable_gid)
    authorize!(galleryable, to: :show?)
    GalleryComponent.new(
      **T.unsafe(
        { galleryable: galleryable, **to_params.except(:galleryable_gid) },
      ),
    )
  end
end

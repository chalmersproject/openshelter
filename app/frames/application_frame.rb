# typed: strict
# frozen_string_literal: true

require "active_form"

class ApplicationFrame
  extend T::Sig
  extend T::Helpers

  abstract!

  extend Enumerize

  include ActiveForm::Base
  include ActionPolicy::Behaviour

  Options =
    T.type_alias do
      T.any(T::Hash[T.untyped, T.untyped], ActionController::Parameters)
    end

  sig do
    params(id: T.nilable(String), options: Options, resources: T.untyped).void
  end
  def initialize(id:, options: {}, **resources)
    @resources = resources
    params = options
    params[:id] = id if id.present?
    super(params: params, **resources)
  end

  # == Attributes ==
  attribute :id, :string, default: -> { SecureRandom.uuid }

  attribute :class_attribute, :string
  alias_param :class, :class_attribute

  # == Resources ==
  sig { returns(T::Hash[Symbol, T.untyped]) }
  attr_reader :resources

  sig { overridable.returns(T::Array[ApplicationRecord]) }
  def authorizable_resources
    []
  end

  # == Methods ==
  sig { overridable.returns(T::Hash[Symbol, T.untyped]) }
  def to_params
    options = attributes.symbolize_keys
    options[:class] = options.delete(:class_attribute)
    options
  end

  sig { returns(String) }
  def to_url
    Rails.application.routes.url_helpers.polymorphic_url(
      model_name.singular_route_key,
      to_params,
    )
  end

  sig { returns(String) }
  def to_path
    Rails.application.routes.url_helpers.polymorphic_path(
      model_name.singular_route_key,
      to_params,
    )
  end

  sig { abstract.returns(ApplicationComponent) }
  def to_component; end
end

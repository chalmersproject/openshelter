# typed: strict
# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  extend T::Sig

  class << self
    extend T::Sig

    sig { void }
    def subcomponent
      @subcomponent = T.let(true, T.nilable(T::Boolean))
    end

    sig { returns(T::Boolean) }
    def subcomponent?
      @subcomponent || false
    end
  end

  sig { params(kwargs: T.untyped).void }
  def initialize(**kwargs)
    super(**kwargs)
    @turbo_frame =
      T.let(kwargs.delete(:turbo_frame), T.nilable(T.any(T::Boolean, String)))
    @other_classes =
      T.let(
        kwargs.delete(:class) { "" },
        T.nilable(T.any(String, Symbol, T::Array[T.any(String, Symbol)])),
      )
    @other_attributes =
      T.let(
        scoped do
          attributes = kwargs
          if attributes.key?(:attributes)
            attributes.merge!(attributes.delete(:attributes))
          end
          attributes.with_indifferent_access
        end,
        T::Hash[Symbol, T.untyped],
      )
  end

  private

  delegate :subcomponent?, to: :class

  # == Attributes ==
  sig do
    returns(T.nilable(T.any(String, Symbol, T::Array[T.any(String, Symbol)])))
  end
  attr_reader :other_classes

  sig { returns(T::Hash[Symbol, T.untyped]) }
  attr_reader :other_attributes

  # TODO: Remove this once AlpineJS is completely removed from the repo.
  sig { params(kwargs: T.untyped).returns(String) }
  def component_data(**kwargs)
    name = T.must(self.class.name)
    params = kwargs.transform_keys { |key| key.to_s.camelize(:lower) }
    params.empty? ? name : "#{name}(#{params.to_json})"
  end

  # == Naming ==
  sig { overridable.returns(String) }
  def component_base_name
    @component_base_name = T.let(@component_base_name, T.nilable(String))
    @component_base_name ||=
      scoped do
        name = T.must(self.class.name)
        name = name.delete_suffix("Component") if subcomponent?
        name.underscore.dasherize.gsub("/", "--")
      end
  end

  sig { params(element: T.nilable(String)).returns(String) }
  def component_name(element = nil)
    if element.present?
      [component_base_name, element.underscore.dasherize].join("--")
    else
      component_base_name
    end
  end

  # == Turbo ==
  sig { returns(T::Boolean) }
  def turbo_frame_request?
    controller.send(:turbo_frame_request?)
  end

  sig { returns(T.nilable(String)) }
  def turbo_frame
    frame = @turbo_frame || turbo_frame_request?
    case frame
    when false
      nil
    when true
      "_self"
    when String
      frame
    end
  end

  # == Content ==
  sig { returns(T::Boolean) }
  def content?
    !content.nil?
  end

  # == Helpers ==
  include Turbo::FramesHelper

  delegate :notice, :alert, :flash?, to: :helpers
  delegate :allowed_to?, to: :helpers
  delegate :breadcrumbs?, :breadcrumb_trail, to: :helpers
  delegate :rich_text_area_tag, to: :helpers
  delegate :local_time, :local_time_ago, to: :helpers
  delegate :feather_icon, :heroicon, to: :helpers
  delegate :user_signed_in?, :current_user, :user_session, to: :helpers
  delegate :admin?, to: :helpers
  delegate :tenant?, :current_tenant, :tenant_domain, to: :helpers
  delegate :playces_io?, :playces_in?, to: :helpers
end

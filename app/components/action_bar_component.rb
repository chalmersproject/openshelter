# typed: strict
# frozen_string_literal: true

class ActionBarComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      object: ApplicationRecord,
      object_label: T.nilable(String),
      action: T.nilable(String),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      show_path: T.untyped,
      edit_path: T.untyped,
      delete_path: T.untyped,
      kwargs: T.untyped,
    ).void
  end
  def initialize(
    object:,
    object_label: nil,
    action: nil,
    only: nil,
    show_path: nil,
    edit_path: nil,
    delete_path: nil,
    **kwargs
  )
    super(**kwargs)
    @object = object
    @object_label = object_label
    @action = action
    @only =
      T.let(only.try! { |only| Array.wrap(only) }, T.nilable(T::Array[Symbol]))
    @show_path = show_path
    @edit_path = edit_path
    @delete_path = delete_path
  end

  sig { override.returns(T::Boolean) }
  def render?
    allowed_to?(:manage?, @object)
  end

  private

  sig { returns(ApplicationRecord) }
  attr_reader :object

  sig { returns(T.untyped) }
  def show_path
    @show_path || object.try(:to_path)
  end

  sig { returns(T.untyped) }
  def edit_path
    @edit_path || object.try(:to_path, :edit)
  end

  sig { returns(T.untyped) }
  def delete_path
    @delete_path || object
  end

  sig { returns(T.nilable(String)) }
  def object_name
    return @object_name if defined?(@object_name)
    @object_name = T.let(@object_name, T.nilable(String))
    @object_name =
      scoped do
        method =
          %i[name name_in_database].find do |method|
            @object.try(method).present?
          end
        @object.public_send(method) if method
      end
  end

  sig { returns(String) }
  def object_label
    @object_label.presence || "a #{@object.model_name.singular.downcase}"
  end

  sig { returns(String) }
  def action
    @action.presence || action_from_template
  end

  sig { returns(String) }
  def action_from_template
    @action_from_template = T.let(@action_from_template, T.nilable(String))
    @action_from_template ||=
      scoped do
        template_path = controller.template_path
        action = File.basename(template_path)
        case action
        when "show"
          "viewing"
        when "edit"
          "editing"
        else
          raise "failed to determine action from template: #{template_path}"
        end
      end
  end

  sig { params(url: T.untyped, block: T.untyped).returns(T.untyped) }
  def action_link_to(url, &block)
    active_link_to(
      url,
      active: :exclusive,
      class: component_name("action"),
      &block
    )
  end

  sig { params(action: Symbol).returns(T::Boolean) }
  def show_action?(action)
    @only.nil? ? true : @only.include?(action)
  end
end

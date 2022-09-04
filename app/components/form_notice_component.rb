# typed: strict
# frozen_string_literal: true

class FormNoticeComponent < ApplicationComponent
  extend T::Sig

  sig { params(form: SimpleForm::FormBuilder, kwargs: T.untyped).void }
  def initialize(form:, **kwargs)
    super(**kwargs)
    @form = form
  end

  sig { override.returns(T::Boolean) }
  def render?
    f.object.errors.present?
  end

  private

  sig { returns(SimpleForm::FormBuilder) }
  attr_reader :form
  alias_method :f, :form

  # sig { returns(T::Boolean) }
  # def errors?
  #   errors = T.let(f.object.errors, T.nilable(ActiveModel::Errors))
  #   if @attributes.present?
  #     errors.present? && (errors.attribute_names & @attributes).present?
  #   else
  #     errors.present?
  #   end
  # end

  # sig { returns(T.nilable(T::Array[String])) }
  # def messages
  #   errors = T.let(f.object.errors, T.nilable(ActiveModel::Errors))
  #   if errors.present?
  #     if @attributes.present?
  #       @attributes.map { |attribute| errors.full_messages_for(attribute) }
  #         .flatten
  #     else
  #       f.object.errors.full_messages
  #     end
  #   end
  # end
end

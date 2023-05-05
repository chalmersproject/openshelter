# typed: true
# frozen_string_literal: true

class EmptyComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      object: T.nilable(T.any(T.class_of(ApplicationRecord), String)),
      subject: T.nilable(ApplicationRecord),
      kwargs: T.untyped,
    ).void
  end
  def initialize(object: nil, subject: nil, **kwargs)
    super(**kwargs)
    @object = object
    @subject = subject
  end

  sig { void }
  def before_render
    if @object.nil? && !content?
      raise "object is required unless content is provided"
    end
  end

  private

  sig { returns(T.nilable(ApplicationRecord)) }
  attr_reader :subject

  sig { returns(String) }
  def object_name
    object = T.must(@object)
    case object
    when String
      object.pluralize
    else
      object.model_name.plural
    end
  end
end

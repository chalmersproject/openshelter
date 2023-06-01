# typed: true
# frozen_string_literal: true

class TagsInputComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      form: SimpleForm::FormBuilder,
      method: Symbol,
      options: T::Hash[T.any(Symbol, String), T.untyped],
      kwargs: T.untyped,
    ).void
  end
  def initialize(form:, method:, options: {}, **kwargs)
    super(**kwargs)
    @form = T.let(form, SimpleForm::FormBuilder)
    @method = T.let(method, Symbol)
    @options = T.let(options, T::Hash[T.any(Symbol, String), T.untyped])
    @tags =
      T.let(
        options[:value] || form.object.public_send(@method),
        T::Array[String],
      )
  end
end

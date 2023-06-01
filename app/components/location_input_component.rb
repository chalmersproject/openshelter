# typed: true
# frozen_string_literal: true

class LocationInputComponent < ApplicationComponent
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
    @location =
      T.let(options[:value] || form.object.public_send(@method), T.untyped)
  end
end

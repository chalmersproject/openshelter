# typed: strict
# frozen_string_literal: true

ActiveModel::Callback =
  T.type_alias do
    T.nilable(
      T.any(
        Symbol,
        String,
        Proc,
        T.proc.void,
        T::Array[T.any(Symbol, String, Proc, T.proc.void)],
      ),
    )
  end

module ActiveModel::Validations
  Message =
    T.type_alias do
      T.any(
        String,
        T
          .proc
          .params(
            object: T.untyped,
            data: {
              model: String,
              attribute: String,
              value: T.untyped,
            },
          )
          .returns(String),
      )
    end

  Strict = T.type_alias { T.nilable(T.any(T::Boolean, T.class_of(Exception))) }
end

module ActiveModel::Validations::ClassMethods
  extend T::Sig

  sig do
    params(
      names: T.any(Symbol, String),
      on: T.nilable(T.any(Symbol, String, T::Array[T.any(Symbol, String)])),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      prepend: T::Boolean,
    ).void
  end
  def validate(*names, on: nil, if: nil, unless: nil, prepend: false); end

  sig do
    params(
      attr_names: T.any(Symbol, String),
      acceptance:
        T.nilable(
          T.any(
            T::Boolean,
            {
              accept: T.nilable(T.untyped),
              message: T.nilable(String),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      comparison:
        T.nilable(
          {
            equal_to: T.nilable(T.untyped),
            other_than: T.nilable(T.untyped),
            greater_than: T.nilable(T.untyped),
            greater_than_or_equal_to: T.nilable(T.untyped),
            less_than: T.nilable(T.untyped),
            less_than_or_equal_to: T.nilable(T.untyped),
            message: T.nilable(ActiveModel::Validations::Message),
            allow_blank: T.nilable(T::Boolean),
            allow_nil: T.nilable(T::Boolean),
            strict: ActiveModel::Validations::Strict,
          },
        ),
      confirmation:
        T.nilable(
          T.any(
            T::Boolean,
            {
              case_sensitive: T.nilable(T::Boolean),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      exclusion:
        T.nilable(
          T.any(
            {
              in: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              within: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      format:
        T.nilable(
          T.any(
            {
              with: Regexp,
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              without: Regexp,
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      inclusion:
        T.nilable(
          T.any(
            {
              in: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              within: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      length:
        T.nilable(
          {
            minimum: T.nilable(T.untyped),
            maximum: T.nilable(T.untyped),
            is: T.nilable(T.untyped),
            in: T.nilable(T::Range[T.untyped]),
            message: T.nilable(ActiveModel::Validations::Message),
            allow_blank: T.nilable(T::Boolean),
            allow_nil: T.nilable(T::Boolean),
            strict: ActiveModel::Validations::Strict,
          },
        ),
      numericality:
        T.nilable(
          T.any(
            T::Boolean,
            {
              only_integer: T.nilable(T::Boolean),
              in: T.nilable(T::Range[T.untyped]),
              odd: T.nilable(T::Boolean),
              even: T.nilable(T::Boolean),
              equal_to: T.nilable(T.untyped),
              other_than: T.nilable(T.untyped),
              greater_than: T.nilable(T.untyped),
              greater_than_or_equal_to: T.nilable(T.untyped),
              less_than: T.nilable(T.untyped),
              less_than_or_equal_to: T.nilable(T.untyped),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      presence:
        T.nilable(
          T.any(
            T::Boolean,
            {
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      absence:
        T.nilable(
          T.any(
            T::Boolean,
            {
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      uniqueness:
        T.nilable(
          T.any(
            T::Boolean,
            {
              scope: T.nilable(T.any(Symbol, T::Array[Symbol])),
              case_sensitive: T.nilable(T::Boolean),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      on: T.nilable(T.any(Symbol, String, T::Array[T.any(Symbol, String)])),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      allow_blank: T.nilable(T::Boolean),
      allow_nil: T.nilable(T::Boolean),
      strict: ActiveModel::Validations::Strict,
    ).void
  end
  def validates(
    *attr_names,
    acceptance: nil,
    comparison: nil,
    confirmation: nil,
    exclusion: nil,
    format: nil,
    inclusion: nil,
    length: nil,
    numericality: nil,
    presence: nil,
    absence: nil,
    uniqueness: nil,
    on: nil,
    if: nil,
    unless: nil,
    allow_blank: nil,
    allow_nil: nil,
    strict: nil
  ); end

  sig do
    params(
      attr_names: T.any(Symbol, String),
      acceptance:
        T.nilable(
          T.any(
            T::Boolean,
            {
              accept: T.nilable(T.untyped),
              message: T.nilable(String),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      comparison:
        T.nilable(
          {
            equal_to: T.nilable(T.untyped),
            other_than: T.nilable(T.untyped),
            greater_than: T.nilable(T.untyped),
            greater_than_or_equal_to: T.nilable(T.untyped),
            less_than: T.nilable(T.untyped),
            less_than_or_equal_to: T.nilable(T.untyped),
            message: T.nilable(ActiveModel::Validations::Message),
            allow_blank: T.nilable(T::Boolean),
            allow_nil: T.nilable(T::Boolean),
            strict: ActiveModel::Validations::Strict,
          },
        ),
      confirmation:
        T.nilable(
          T.any(
            T::Boolean,
            {
              case_sensitive: T.nilable(T::Boolean),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      exclusion:
        T.nilable(
          T.any(
            {
              in: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              within: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      format:
        T.nilable(
          T.any(
            {
              with: Regexp,
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              without: Regexp,
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      inclusion:
        T.nilable(
          T.any(
            {
              in: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
            {
              within: T::Enumerable[T.untyped],
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      length:
        T.nilable(
          {
            minimum: T.nilable(T.untyped),
            maximum: T.nilable(T.untyped),
            is: T.nilable(T.untyped),
            in: T.nilable(T::Range[T.untyped]),
            message: T.nilable(ActiveModel::Validations::Message),
            allow_blank: T.nilable(T::Boolean),
            allow_nil: T.nilable(T::Boolean),
            strict: ActiveModel::Validations::Strict,
          },
        ),
      numericality:
        T.nilable(
          T.any(
            T::Boolean,
            {
              only_integer: T.nilable(T::Boolean),
              in: T.nilable(T::Range[T.untyped]),
              odd: T.nilable(T::Boolean),
              even: T.nilable(T::Boolean),
              equal_to: T.nilable(T.untyped),
              other_than: T.nilable(T.untyped),
              greater_than: T.nilable(T.untyped),
              greater_than_or_equal_to: T.nilable(T.untyped),
              less_than: T.nilable(T.untyped),
              less_than_or_equal_to: T.nilable(T.untyped),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      presence:
        T.nilable(
          T.any(
            T::Boolean,
            {
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      absence:
        T.nilable(
          T.any(
            T::Boolean,
            {
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      uniqueness:
        T.nilable(
          T.any(
            T::Boolean,
            {
              scope: T.nilable(T.any(Symbol, T::Array[Symbol])),
              case_sensitive: T.nilable(T::Boolean),
              message: T.nilable(ActiveModel::Validations::Message),
              allow_blank: T.nilable(T::Boolean),
              allow_nil: T.nilable(T::Boolean),
              strict: ActiveModel::Validations::Strict,
            },
          ),
        ),
      on: T.nilable(T.any(Symbol, String, T::Array[T.any(Symbol, String)])),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      allow_blank: T.nilable(T::Boolean),
      allow_nil: T.nilable(T::Boolean),
    ).void
  end
  def validates!(
    *attr_names,
    acceptance: nil,
    comparison: nil,
    confirmation: nil,
    exclusion: nil,
    format: nil,
    inclusion: nil,
    length: nil,
    numericality: nil,
    presence: nil,
    absence: nil,
    uniqueness: nil,
    on: nil,
    if: nil,
    unless: nil,
    allow_blank: nil,
    allow_nil: nil
  ); end

  sig do
    params(
      attr_names: Symbol,
      block:
        T.nilable(
          T.proc.params(record: T.untyped, attr: Symbol, value: T.untyped).void,
        ),
    ).void
  end
  def validates_each(*attr_names, &block); end

  sig { params(classes: Class, options: T.untyped).void }
  def validates_with(*classes, **options); end
end

class ActiveModel::Errors
  extend T::Sig

  sig do
    params(
        attribute: T.any(Symbol, String),
        type: T.any(Symbol, String),
        message: T.nilable(String),
      )
      .returns(T.untyped)
  end
  def add(attribute, type = :invalid, message: nil); end
end

# typed: strict
# frozen_string_literal: true

ActiveModel::Callback =
  T.type_alias do
    T.any(
      Symbol,
      String,
      Proc,
      T.proc.void,
      T::Array[T.any(Symbol, String, Proc, T.proc.void)],
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

  Strict = T.type_alias { T.any(T::Boolean, T.class_of(Exception)) }
end

module ActiveModel::Validations::ClassMethods
  extend T::Sig

  sig do
    params(
      names: T.any(Symbol, String),
      on: T.any(Symbol, String, T::Array[T.any(Symbol, String)]),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      prepend: T::Boolean,
    ).void
  end
  def validate(
    *names,
    on: T.unsafe(nil),
    if: T.unsafe(nil),
    unless: T.unsafe(nil),
    prepend: false
  ); end

  sig do
    params(
      attr_names: T.any(Symbol, String),
      acceptance: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      comparison: T::Hash[Symbol, T.untyped],
      confirmation: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      exclusion: T::Hash[Symbol, T.untyped],
      format: T::Hash[Symbol, T.untyped],
      inclusion: T::Hash[Symbol, T.untyped],
      length: T::Hash[Symbol, T.untyped],
      numericality: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      presence: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      absence: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      uniqueness: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      on: T.any(Symbol, String, T::Array[T.any(Symbol, String)]),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      allow_blank: T::Boolean,
      allow_nil: T::Boolean,
      strict: ActiveModel::Validations::Strict,
      options: T.untyped,
    ).void
  end
  def validates(
    *attr_names,
    acceptance: T.unsafe(nil),
    comparison: T.unsafe(nil),
    confirmation: T.unsafe(nil),
    exclusion: T.unsafe(nil),
    format: T.unsafe(nil),
    inclusion: T.unsafe(nil),
    length: T.unsafe(nil),
    numericality: T.unsafe(nil),
    presence: T.unsafe(nil),
    absence: T.unsafe(nil),
    uniqueness: T.unsafe(nil),
    on: T.unsafe(nil),
    if: T.unsafe(nil),
    unless: T.unsafe(nil),
    allow_blank: T.unsafe(nil),
    allow_nil: T.unsafe(nil),
    strict: T.unsafe(nil),
    **options
  ); end

  sig do
    params(
      attr_names: T.any(Symbol, String),
      acceptance: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      comparison: T::Hash[Symbol, T.untyped],
      confirmation: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      exclusion: T::Hash[Symbol, T.untyped],
      format: T::Hash[Symbol, T.untyped],
      inclusion: T::Hash[Symbol, T.untyped],
      length: T::Hash[Symbol, T.untyped],
      numericality: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      presence: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      absence: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      uniqueness: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      on: T.any(Symbol, String, T::Array[T.any(Symbol, String)]),
      if: ActiveModel::Callback,
      unless: ActiveModel::Callback,
      allow_blank: T::Boolean,
      allow_nil: T::Boolean,
      options: T.untyped,
    ).void
  end
  def validates!(
    *attr_names,
    acceptance: T.unsafe(nil),
    comparison: T.unsafe(nil),
    confirmation: T.unsafe(nil),
    exclusion: T.unsafe(nil),
    format: T.unsafe(nil),
    inclusion: T.unsafe(nil),
    length: T.unsafe(nil),
    numericality: T.unsafe(nil),
    presence: T.unsafe(nil),
    absence: T.unsafe(nil),
    uniqueness: T.unsafe(nil),
    on: T.unsafe(nil),
    if: T.unsafe(nil),
    unless: T.unsafe(nil),
    allow_blank: T.unsafe(nil),
    allow_nil: T.unsafe(nil),
    **options
  ); end

  # sig do
  #   params(
  #     attr_names: T.any(Symbol, String),
  #     acceptance:
  #       T.any(
  #         T::Boolean,
  #         {
  #           accept: T.nilable(T.untyped),
  #           message: T.nilable(String),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     comparison: {
  #       equal_to: T.nilable(T.untyped),
  #       other_than: T.nilable(T.untyped),
  #       greater_than: T.nilable(T.untyped),
  #       greater_than_or_equal_to: T.nilable(T.untyped),
  #       less_than: T.nilable(T.untyped),
  #       less_than_or_equal_to: T.nilable(T.untyped),
  #       message: T.nilable(ActiveModel::Validations::Message),
  #       allow_blank: T.nilable(T::Boolean),
  #       allow_nil: T.nilable(T::Boolean),
  #       strict: T.nilable(ActiveModel::Validations::Strict),
  #     },
  #     confirmation:
  #       T.any(
  #         T::Boolean,
  #         {
  #           case_sensitive: T.nilable(T::Boolean),
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     exclusion:
  #       T.any(
  #         {
  #           in: T::Enumerable[T.untyped],
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #         {
  #           within: T::Enumerable[T.untyped],
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     format:
  #       T.any(
  #         {
  #           with: Regexp,
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T::Boolean,
  #           allow_nil: T::Boolean,
  #           strict: ActiveModel::Validations::Strict,
  #         },
  #         {
  #           without: Regexp,
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     inclusion:
  #       T.any(
  #         {
  #           in: T::Enumerable[T.untyped],
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #         {
  #           within: T::Enumerable[T.untyped],
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     length: {
  #       minimum: T.nilable(T.untyped),
  #       maximum: T.nilable(T.untyped),
  #       is: T.nilable(T.untyped),
  #       in: T.nilable(T::Range[T.untyped]),
  #       message: T.nilable(ActiveModel::Validations::Message),
  #       allow_blank: T.nilable(T::Boolean),
  #       allow_nil: T.nilable(T::Boolean),
  #       strict: T.nilable(ActiveModel::Validations::Strict),
  #     },
  #     numericality:
  #       T.any(
  #         T::Boolean,
  #         {
  #           only_integer: T.nilable(T::Boolean),
  #           in: T.nilable(T::Range[T.untyped]),
  #           odd: T.nilable(T::Boolean),
  #           even: T.nilable(T::Boolean),
  #           equal_to: T.nilable(T.untyped),
  #           other_than: T.nilable(T.untyped),
  #           greater_than: T.nilable(T.untyped),
  #           greater_than_or_equal_to: T.nilable(T.untyped),
  #           less_than: T.nilable(T.untyped),
  #           less_than_or_equal_to: T.nilable(T.untyped),
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     presence:
  #       T.any(
  #         T::Boolean,
  #         {
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     absence:
  #       T.any(
  #         T::Boolean,
  #         {
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     uniqueness:
  #       T.any(
  #         T::Boolean,
  #         {
  #           scope: T.nilable(T.any(Symbol, T::Array[Symbol])),
  #           case_sensitive: T.nilable(T::Boolean),
  #           message: T.nilable(ActiveModel::Validations::Message),
  #           allow_blank: T.nilable(T::Boolean),
  #           allow_nil: T.nilable(T::Boolean),
  #           strict: T.nilable(ActiveModel::Validations::Strict),
  #         },
  #       ),
  #     on: T.any(Symbol, String, T::Array[T.any(Symbol, String)]),
  #     if: ActiveModel::Callback,
  #     unless: ActiveModel::Callback,
  #     allow_blank: T::Boolean,
  #     allow_nil: T::Boolean,
  #   ).void
  # end
  # def validates!(
  #   *attr_names,
  #   acceptance: T.unsafe(nil),
  #   comparison: T.unsafe(nil),
  #   confirmation: T.unsafe(nil),
  #   exclusion: T.unsafe(nil),
  #   format: T.unsafe(nil),
  #   inclusion: T.unsafe(nil),
  #   length: T.unsafe(nil),
  #   numericality: T.unsafe(nil),
  #   presence: T.unsafe(nil),
  #   absence: T.unsafe(nil),
  #   uniqueness: T.unsafe(nil),
  #   on: T.unsafe(nil),
  #   if: T.unsafe(nil),
  #   unless: T.unsafe(nil),
  #   allow_blank: T.unsafe(nil),
  #   allow_nil: T.unsafe(nil)
  # ); end

  sig do
    params(
      attr_names: Symbol,
      block:
        T.proc.params(record: T.untyped, attr: Symbol, value: T.untyped).void,
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
        message: String,
      )
      .returns(T.untyped)
  end
  def add(attribute, type = :invalid, message: T.unsafe(nil)); end
end

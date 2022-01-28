# typed: strict
# frozen_string_literal: true

ActiveRecord::Callback =
  T.type_alias do
    T.any(
      Symbol,
      String,
      Proc,
      T.proc.void,
      T::Array[T.any(Symbol, String, Proc, T.proc.void)],
    )
  end

module ActiveRecord::Associations::ClassMethods
  extend T::Sig

  sig do
    params(
      name: Symbol,
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      after_add: ActiveRecord::Callback,
      after_remove: ActiveRecord::Callback,
      anonymous_class: T.any(Symbol, String),
      as: T.any(Symbol, String),
      autosave: T::Boolean,
      before_add: ActiveRecord::Callback,
      before_remove: ActiveRecord::Callback,
      class_name: T.any(Symbol, String),
      counter_cache: T.any(Symbol, String),
      dependent: T.any(Symbol, String),
      extend: T.any(Module, T::Array[Module]),
      foreign_key: T.any(Symbol, String),
      foreign_type: T.any(Symbol, String),
      index_errors: T::Boolean,
      inverse_of: T.any(Symbol, String, FalseClass),
      join_table: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      source: T.any(Symbol, String),
      source_type: T.any(Symbol, String),
      table_name: T.any(Symbol, String),
      through: T.any(Symbol, String),
      validate: T::Boolean,
      block: T.proc.void,
    ).void
  end
  def has_many(
    name,
    scope = nil,
    after_add: T.unsafe(nil),
    after_remove: T.unsafe(nil),
    anonymous_class: T.unsafe(nil),
    as: T.unsafe(nil),
    autosave: T.unsafe(nil),
    before_add: T.unsafe(nil),
    before_remove: T.unsafe(nil),
    class_name: T.unsafe(nil),
    counter_cache: T.unsafe(nil),
    dependent: T.unsafe(nil),
    extend: T.unsafe(nil),
    foreign_key: T.unsafe(nil),
    foreign_type: T.unsafe(nil),
    index_errors: T.unsafe(nil),
    inverse_of: T.unsafe(nil),
    join_table: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    source: T.unsafe(nil),
    source_type: T.unsafe(nil),
    table_name: T.unsafe(nil),
    through: T.unsafe(nil),
    validate: T.unsafe(nil),
    &block
  ); end

  sig do
    params(
      name: Symbol,
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      anonymous_class: T.any(Symbol, String),
      as: T.any(Symbol, String),
      autosave: T::Boolean,
      class_name: T.any(Symbol, String),
      dependent: T.any(Symbol, String),
      foreign_key: T.any(Symbol, String),
      foreign_type: T.any(Symbol, String),
      inverse_of: T.any(Symbol, String, FalseClass),
      primary_key: T.any(Symbol, String),
      required: T::Boolean,
      source: T.any(Symbol, String),
      source_type: T.any(Symbol, String),
      through: T.any(Symbol, String),
      validate: T::Boolean,
      touch: T.any(T::Boolean, Symbol),
      block: T.proc.void,
    ).void
  end
  def has_one(
    name,
    scope = nil,
    anonymous_class: T.unsafe(nil),
    as: T.unsafe(nil),
    autosave: T.unsafe(nil),
    class_name: T.unsafe(nil),
    dependent: T.unsafe(nil),
    foreign_key: T.unsafe(nil),
    foreign_type: T.unsafe(nil),
    inverse_of: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    required: T.unsafe(nil),
    source: T.unsafe(nil),
    source_type: T.unsafe(nil),
    through: T.unsafe(nil),
    validate: T.unsafe(nil),
    touch: T.unsafe(nil),
    &block
  ); end

  sig do
    params(
      name: T.any(Symbol, String),
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      autosave: T::Boolean,
      class_name: T.any(Symbol, String),
      counter_cache: T.any(Symbol, String, T::Boolean),
      dependent: T.any(Symbol, String),
      foreign_key: T.any(Symbol, String),
      foreign_type: T.any(Symbol, String),
      inverse_of: T.any(Symbol, String, FalseClass),
      optional: T::Boolean,
      polymorphic: T::Boolean,
      primary_key: T.any(Symbol, String),
      required: T::Boolean,
      touch: T.any(T::Boolean, Symbol),
      validate: T::Boolean,
      default: T.proc.returns(T.untyped),
    ).void
  end
  def belongs_to(
    name,
    scope = nil,
    autosave: T.unsafe(nil),
    class_name: T.unsafe(nil),
    counter_cache: T.unsafe(nil),
    dependent: T.unsafe(nil),
    foreign_key: T.unsafe(nil),
    foreign_type: T.unsafe(nil),
    inverse_of: T.unsafe(nil),
    optional: T.unsafe(nil),
    polymorphic: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    required: T.unsafe(nil),
    touch: T.unsafe(nil),
    validate: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  sig do
    params(
      name: T.any(Symbol, String),
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      after_add: ActiveRecord::Callback,
      after_remove: ActiveRecord::Callback,
      association_foreign_key: T.any(Symbol, String),
      autosave: T::Boolean,
      before_add: ActiveRecord::Callback,
      before_remove: ActiveRecord::Callback,
      class_name: T.any(Symbol, String),
      extend: T.any(Module, T::Array[Module]),
      foreign_key: T.any(Symbol, String),
      inverse_of: T.any(Symbol, String, FalseClass),
      join_table: T.any(Symbol, String),
      validate: T::Boolean,
      block: T.proc.void,
    ).void
  end
  def has_and_belongs_to_many(
    name,
    scope = nil,
    after_add: T.unsafe(nil),
    after_remove: T.unsafe(nil),
    association_foreign_key: T.unsafe(nil),
    autosave: T.unsafe(nil),
    before_add: T.unsafe(nil),
    before_remove: T.unsafe(nil),
    class_name: T.unsafe(nil),
    extend: T.unsafe(nil),
    foreign_key: T.unsafe(nil),
    inverse_of: T.unsafe(nil),
    join_table: T.unsafe(nil),
    validate: T.unsafe(nil),
    &block
  ); end
end

module ActiveRecord::AttributeMethods::Serialization::ClassMethods
  extend T::Sig

  sig do
    params(
      attr_name: Symbol,
      class_name_or_coder: T.untyped,
      default: T.untyped,
    ).void
  end
  def serialize(attr_name, class_name_or_coder = Object, default: nil); end
end

class ActiveRecord::Migration::Compatibility::V5_2
  extend T::Sig

  sig do
    params(
      table_name: T.any(String, Symbol),
      comment: T.untyped,
      id: T.any(T::Boolean, Symbol),
      primary_key: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      options: T.untyped,
      temporary: T::Boolean,
      force: T.any(T::Boolean, Symbol),
      as: T.untyped,
      block:
        T.nilable(
          T
            .proc
            .params(t: ActiveRecord::ConnectionAdapters::TableDefinition)
            .void,
        ),
    ).void
  end
  def create_table(
    table_name,
    comment: nil,
    id: :primary_key,
    primary_key: :_,
    options: nil,
    temporary: false,
    force: false,
    as: nil,
    &block
  ); end
end

# module ActiveRecord::NestedAttributes::ClassMethods
#   extend T::Sig

#   sig do
#     params(
#       attr_names: T.any(Symbol, String),
#       allow_destroy: T.nilable(T::Boolean),
#       reject_if:
#         T.nilable(
#           T.any(
#             Symbol,
#             String,
#             T
#               .proc
#               .params(
#                 attributes:
#                   T.any(
#                     T::Hash[T.any(Symbol, String), T.untyped],
#                     ActionController::Parameters,
#                   ),
#               )
#               .returns(T::Boolean),
#           ),
#         ),
#       limit: T.nilable(T.any(Integer, Symbol, T.proc.returns(Integer))),
#       update_only: T.nilable(T::Boolean),
#     ).void
#   end
#   def accepts_nested_attributes_for(
#     *attr_names,
#     allow_destroy: nil,
#     reject_if: nil,
#     limit: nil,
#     update_only: nil
#   ); end
# end

class ActiveRecord::Base
  class << self
    extend T::Sig

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def before_create(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def after_create(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def around_create(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        prepend: T::Boolean,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def before_destroy(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      prepend: false,
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def after_destroy(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def around_destroy(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def before_save(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: T.any(Symbol, String),
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def after_save(*args, if: T.unsafe(nil), unless: T.unsafe(nil), &block); end

    sig do
      params(
        args: Symbol,
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def around_save(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: Symbol,
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def before_update(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: Symbol,
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def after_update(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end

    sig do
      params(
        args: Symbol,
        if: ActiveRecord::Callback,
        unless: ActiveRecord::Callback,
        block: T.proc.bind(T.untyped).void,
      ).void
    end
    def around_update(
      *args,
      if: T.unsafe(nil),
      unless: T.unsafe(nil),
      &block
    ); end
  end
end

ActiveRecord::Persistence::Returning =
  T.type_alias { T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])) }

module ActiveRecord::Persistence
  extend T::Sig

  sig do
    params(validate: T::Boolean, touch: T::Boolean, block: T.proc.void)
      .returns(T::Boolean)
  end
  def save(validate: true, touch: true, &block)
    false
  end

  sig do
    params(validate: T::Boolean, touch: T::Boolean, block: T.proc.void)
      .returns(TrueClass)
  end
  def save!(validate: true, touch: true, &block)
    true
  end

  module ClassMethods
    extend T::Sig

    sig do
      params(
          attributes: T::Hash[T.any(Symbol, String), T.untyped],
          returning: ActiveRecord::Persistence::Returning,
          unique_by: T.nilable(T.untyped),
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def insert(
      attributes,
      returning: nil,
      unique_by: nil,
      record_timestamps: nil
    )
      T.unsafe(nil)
    end

    sig do
      params(
          attributes: T::Hash[T.any(Symbol, String), T.untyped],
          returning: ActiveRecord::Persistence::Returning,
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def insert!(attributes, returning: nil, record_timestamps: nil)
      T.unsafe(nil)
    end

    sig do
      params(
          attributes: T::Array[T::Hash[T.any(Symbol, String), T.untyped]],
          returning: ActiveRecord::Persistence::Returning,
          unique_by: T.nilable(T.untyped),
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def insert_all(
      attributes,
      returning: nil,
      unique_by: nil,
      record_timestamps: nil
    )
      T.unsafe(nil)
    end

    sig do
      params(
          attributes: T::Array[T::Hash[T.any(Symbol, String), T.untyped]],
          returning: ActiveRecord::Persistence::Returning,
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def insert_all!(attributes, returning: nil, record_timestamps: nil)
      T.unsafe(nil)
    end

    sig do
      params(
          attributes: T::Hash[T.any(Symbol, String), T.untyped],
          on_duplicate: T.nilable(T.untyped),
          returning: ActiveRecord::Persistence::Returning,
          unique_by: T.nilable(T.untyped),
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def upsert(
      attributes,
      on_duplicate: nil,
      returning: nil,
      unique_by: nil,
      record_timestamps: nil
    )
      T.unsafe(nil)
    end

    sig do
      params(
          attributes: T::Hash[T.any(Symbol, String), T.untyped],
          on_duplicate: T.nilable(T.untyped),
          update_only: T.nilable(T.any(Symbol, String)),
          returning:
            T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
          unique_by: T.nilable(T.untyped),
          record_timestamps: T.nilable(T::Boolean),
        )
        .returns(ActiveRecord::Result)
    end
    def upsert_all(
      attributes,
      on_duplicate: nil,
      update_only: nil,
      returning: nil,
      unique_by: nil,
      record_timestamps: nil
    )
      T.unsafe(nil)
    end
  end
end

class ActiveRecord::ConnectionAdapters::TableDefinition
  extend T::Sig

  sig do
    params(
      column_name: T.any(String, Symbol),
      type: Symbol,
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      default: T.untyped,
      limit: Numeric,
      null: T::Boolean,
      precision: Numeric,
      scale: Numeric,
      collation: T.untyped,
      comment: String,
      if_not_exists: T::Boolean,
    ).void
  end
  def column(
    column_name,
    type,
    index: nil,
    default: T.unsafe(nil),
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
      column_name: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      name: T.nilable(String),
      unique: T.nilable(T::Boolean),
      length:
        T.nilable(T.any(Numeric, T::Hash[T.any(Symbol, String), Numeric])),
      if_not_exists: T::Boolean,
    ).void
  end
  def index(
    column_name,
    name: nil,
    unique: nil,
    length: nil,
    if_not_exists: false
  ); end
end

class ActiveRecord::ConnectionAdapters::Table
  extend T::Sig

  sig do
    params(
      column_name: T.any(String, Symbol),
      type: Symbol,
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      default: T.untyped,
      limit: Numeric,
      null: T::Boolean,
      precision: Numeric,
      scale: Numeric,
      collation: T.untyped,
      comment: String,
      if_not_exists: T::Boolean,
    ).void
  end
  def column(
    column_name,
    type,
    index: nil,
    default: T.unsafe(nil),
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
        column_name: T.any(String, Symbol),
        type: T.nilable(Symbol),
        index:
          T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
        limit: Numeric,
        null: T::Boolean,
        precision: Numeric,
        scale: Numeric,
        collation: T.untyped,
        comment: String,
        if_not_exists: T::Boolean,
      )
      .returns(T::Boolean)
  end
  def column_exists?(
    column_name,
    type = nil,
    index: nil,
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  )
    false
  end

  sig do
    params(
      column_name: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      name: String,
      unique: T::Boolean,
      length: T.any(Numeric, T::Hash[T.any(Symbol, String), Numeric]),
      if_not_exists: T::Boolean,
    ).void
  end
  def index(
    column_name,
    name: T.unsafe(nil),
    unique: T.unsafe(nil),
    length: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      limit: Numeric,
      null: T::Boolean,
      precision: Numeric,
      scale: Numeric,
      collation: T.untyped,
      comment: String,
      if_not_exists: T::Boolean,
    ).void
  end
  def timestamps(
    index: nil,
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
      column_name: T.any(String, Symbol),
      type: Symbol,
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      limit: Numeric,
      null: T::Boolean,
      precision: Numeric,
      scale: Numeric,
      collation: T.untyped,
      comment: String,
      if_not_exists: T::Boolean,
    ).void
  end
  def change(
    column_name,
    type,
    index: nil,
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
      column_names: T.any(Symbol, String),
      type: T.nilable(Symbol),
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      limit: T.nilable(Numeric),
      null: T::Boolean,
      precision: T.nilable(Numeric),
      scale: T.nilable(Numeric),
      collation: T.nilable(T.untyped),
      comment: T.nilable(String),
      if_not_exists: T::Boolean,
    ).void
  end
  def remove(
    *column_names,
    type: nil,
    index: nil,
    limit: T.unsafe(nil),
    null: T.unsafe(nil),
    precision: T.unsafe(nil),
    scale: T.unsafe(nil),
    collation: T.unsafe(nil),
    comment: T.unsafe(nil),
    if_not_exists: T.unsafe(nil)
  ); end

  sig do
    params(
      column_name: T.nilable(T.any(Symbol, String)),
      column: T.any(Symbol, String, T::Array[T.any(Symbol, String)]),
      name: T.any(Symbol, String),
      if_exists: T::Boolean,
      algorithm: Symbol,
    ).void
  end
  def remove_index(
    column_name = nil,
    column: T.unsafe(nil),
    name: T.unsafe(nil),
    if_exists: T.unsafe(nil),
    algorithm: T.unsafe(nil)
  ); end

  sig { void }
  def remove_timestamps; end

  sig do
    params(
      to_table: T.any(Symbol, String),
      column: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      name: T.any(Symbol, String),
      on_delete: Symbol,
      on_update: Symbol,
      if_not_exists: T::Boolean,
      validate: T::Boolean,
      deferrable: T.any(FalseClass, Symbol),
    ).void
  end
  def foreign_key(
    to_table,
    column: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    name: T.unsafe(nil),
    on_delete: T.unsafe(nil),
    on_update: T.unsafe(nil),
    if_not_exists: T.unsafe(nil),
    validate: true,
    deferrable: false
  ); end

  sig do
    params(
      to_table: T.any(Symbol, String),
      column: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      name: T.any(Symbol, String),
      on_delete: Symbol,
      on_update: Symbol,
      if_not_exists: T::Boolean,
      validate: T::Boolean,
      deferrable: T.any(FalseClass, Symbol),
    ).void
  end
  def remove_foreign_key(
    to_table,
    column: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    name: T.unsafe(nil),
    on_delete: T.unsafe(nil),
    on_update: T.unsafe(nil),
    if_not_exists: T.unsafe(nil),
    validate: true,
    deferrable: false
  ); end

  sig do
    params(
      to_table: T.nilable(T.any(Symbol, String)),
      column: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      name: T.any(Symbol, String),
      on_delete: Symbol,
      on_update: Symbol,
      if_not_exists: T::Boolean,
      validate: T::Boolean,
      deferrable: T.any(FalseClass, Symbol),
    ).void
  end
  def foreign_key_exists?(
    to_table = nil,
    column: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    name: T.unsafe(nil),
    on_delete: T.unsafe(nil),
    on_update: T.unsafe(nil),
    if_not_exists: T.unsafe(nil),
    validate: T.unsafe(nil),
    deferrable: T.unsafe(nil)
  ); end
end

module ActiveRecord::Locking::Pessimistic
  extend T::Sig

  sig { params(lock: T.any(TrueClass, String)).returns(T.self_type) }
  def lock!(lock = true)
    self
  end

  sig do
    type_parameters(:U)
      .params(
        lock: T.any(TrueClass, String),
        requires_new: T.nilable(T::Boolean),
        isolation: T.nilable(Symbol),
        joinable: T::Boolean,
        block: T.proc.returns(T.type_parameter(:U)),
      )
      .returns(T.nilable(T.type_parameter(:U)))
  end
  def with_lock(
    lock = true,
    requires_new: nil,
    isolation: nil,
    joinable: true,
    &block
  ); end
end

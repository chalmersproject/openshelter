# typed: strict
# frozen_string_literal: true

AssociationCallback =
  T.type_alias do
    T.nilable(
      T.any(
        Symbol, # reference to a method
        String, # reference to a method? not clear: no string examples in docs
        T.proc.void, # a lambda that contains the callback
        Proc, # a proc that contains the callback
        T::Array[T.any(Symbol, Proc, T.proc.void)], # multiple callbacks
      ),
    )
  end

module ActiveRecord::Associations::ClassMethods
  extend T::Sig

  sig do
    params(
      name: Symbol,
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      after_add: AssociationCallback,
      after_remove: AssociationCallback,
      anonymous_class: T.nilable(T.any(Symbol, String)),
      as: T.nilable(T.any(Symbol, String)),
      autosave: T.nilable(T::Boolean),
      before_add: AssociationCallback,
      before_remove: AssociationCallback,
      class_name: T.nilable(T.any(Symbol, String)),
      counter_cache: T.nilable(T.any(Symbol, String)),
      dependent: T.nilable(T.any(Symbol, String)),
      extend: T.nilable(T.any(Module, T::Array[Module])),
      foreign_key: T.nilable(T.any(Symbol, String)),
      foreign_type: T.nilable(T.any(Symbol, String)),
      index_errors: T.nilable(T::Boolean),
      inverse_of: T.nilable(T.any(Symbol, String, FalseClass)),
      join_table: T.nilable(T.any(Symbol, String)),
      primary_key: T.nilable(T.any(Symbol, String)),
      source: T.nilable(T.any(Symbol, String)),
      source_type: T.nilable(T.any(Symbol, String)),
      table_name: T.nilable(T.any(Symbol, String)),
      through: T.nilable(T.any(Symbol, String)),
      validate: T.nilable(T::Boolean),
      block: T.nilable(T.proc.void),
    ).void
  end
  def has_many(
    name,
    scope = nil,
    after_add: nil,
    after_remove: nil,
    anonymous_class: nil,
    as: nil,
    autosave: nil,
    before_add: nil,
    before_remove: nil,
    class_name: nil,
    counter_cache: nil,
    dependent: nil,
    extend: nil,
    foreign_key: nil,
    foreign_type: nil,
    index_errors: nil,
    inverse_of: nil,
    join_table: nil,
    primary_key: nil,
    source: nil,
    source_type: nil,
    table_name: nil,
    through: nil,
    validate: nil,
    &block
  ); end

  sig do
    params(
      name: Symbol,
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      anonymous_class: T.nilable(T.any(Symbol, String)),
      as: T.nilable(T.any(Symbol, String)),
      autosave: T.nilable(T::Boolean),
      class_name: T.nilable(T.any(Symbol, String)),
      dependent: T.nilable(T.any(Symbol, String)),
      foreign_key: T.nilable(T.any(Symbol, String)),
      foreign_type: T.nilable(T.any(Symbol, String)),
      inverse_of: T.nilable(T.any(Symbol, String, FalseClass)),
      primary_key: T.nilable(T.any(Symbol, String)),
      required: T.nilable(T::Boolean),
      source: T.nilable(T.any(Symbol, String)),
      source_type: T.nilable(T.any(Symbol, String)),
      through: T.nilable(T.any(Symbol, String)),
      validate: T.nilable(T::Boolean),
      touch: T.nilable(T.any(T::Boolean, Symbol)),
      block: T.nilable(T.proc.void),
    ).void
  end
  def has_one(
    name,
    scope = nil,
    anonymous_class: nil,
    as: nil,
    autosave: nil,
    class_name: nil,
    dependent: nil,
    foreign_key: nil,
    foreign_type: nil,
    inverse_of: nil,
    primary_key: nil,
    required: nil,
    source: nil,
    source_type: nil,
    through: nil,
    validate: nil,
    touch: nil,
    &block
  ); end

  sig do
    params(
      name: T.nilable(T.any(Symbol, String)),
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      autosave: T.nilable(T::Boolean),
      class_name: T.nilable(T.any(Symbol, String)),
      counter_cache: T.nilable(T.any(Symbol, String, T::Boolean)),
      dependent: T.nilable(T.any(Symbol, String)),
      foreign_key: T.nilable(T.any(Symbol, String)),
      foreign_type: T.nilable(T.any(Symbol, String)),
      inverse_of: T.nilable(T.any(Symbol, String, FalseClass)),
      optional: T.nilable(T::Boolean),
      polymorphic: T.nilable(T::Boolean),
      primary_key: T.nilable(T.any(Symbol, String)),
      required: T.nilable(T::Boolean),
      touch: T.nilable(T.any(T::Boolean, Symbol)),
      validate: T.nilable(T::Boolean),
      default: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def belongs_to(
    name,
    scope = nil,
    autosave: nil,
    class_name: nil,
    counter_cache: nil,
    dependent: nil,
    foreign_key: nil,
    foreign_type: nil,
    inverse_of: nil,
    optional: nil,
    polymorphic: nil,
    primary_key: nil,
    required: nil,
    touch: nil,
    validate: nil,
    default: nil
  ); end

  sig do
    params(
      name: T.nilable(T.any(Symbol, String)),
      scope:
        T.nilable(T.any(T.proc.void, T.proc.params(record: T.untyped).void)),
      after_add: AssociationCallback,
      after_remove: AssociationCallback,
      association_foreign_key: T.nilable(T.any(Symbol, String)),
      autosave: T.nilable(T::Boolean),
      before_add: AssociationCallback,
      before_remove: AssociationCallback,
      class_name: T.nilable(T.any(Symbol, String)),
      extend: T.nilable(T.any(Module, T::Array[Module])),
      foreign_key: T.nilable(T.any(Symbol, String)),
      inverse_of: T.nilable(T.any(Symbol, String, FalseClass)),
      join_table: T.nilable(T.any(Symbol, String)),
      validate: T.nilable(T::Boolean),
      block: T.nilable(T.proc.void),
    ).void
  end
  def has_and_belongs_to_many(
    name,
    scope = nil,
    after_add: nil,
    after_remove: nil,
    association_foreign_key: nil,
    autosave: nil,
    before_add: nil,
    before_remove: nil,
    class_name: nil,
    extend: nil,
    foreign_key: nil,
    inverse_of: nil,
    join_table: nil,
    validate: nil,
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

module ActiveRecord::NestedAttributes::ClassMethods
  extend T::Sig

  sig do
    params(
      attr_names: T.any(Symbol, String),
      allow_destroy: T.nilable(T::Boolean),
      reject_if:
        T.nilable(
          T.any(
            Symbol,
            Proc,
            T
              .proc
              .params(
                attributes:
                  T.any(
                    T::Hash[T.any(Symbol, String), T.untyped],
                    ActionController::Parameters,
                  ),
              )
              .returns(T::Boolean),
          ),
        ),
      limit: T.nilable(T.any(Integer, Symbol, Proc, T.proc.returns(Integer))),
      update_only: T.nilable(T::Boolean),
    ).void
  end
  def accepts_nested_attributes_for(
    *attr_names,
    allow_destroy: nil,
    reject_if: nil,
    limit: nil,
    update_only: nil
  ); end
end

class ActiveRecord::Base
  class << self
    extend T::Sig

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def before_create(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def after_create(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def around_create(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        prepend: T::Boolean,
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def before_destroy(*args, if: nil, unless: nil, prepend: false, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def after_destroy(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def around_destroy(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def before_save(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def after_save(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def around_save(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def before_update(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def after_update(*args, if: nil, unless: nil, &block); end

    sig do
      params(
        args: Symbol,
        if:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        unless:
          T.nilable(
            T.any(
              Symbol,
              Proc,
              T.proc.params(arg0: T.untyped).returns(T.nilable(T::Boolean)),
            ),
          ),
        block: T.nilable(T.proc.bind(T.untyped).void),
      ).void
    end
    def around_update(*args, if: nil, unless: nil, &block); end
  end
end

module ActiveRecord::Persistence
  extend T::Sig

  sig do
    params(
        validate: T.nilable(T::Boolean),
        touch: T.nilable(T::Boolean),
        block: T.nilable(T.proc.void),
      )
      .returns(T::Boolean)
  end
  def save(validate: nil, touch: nil, &block)
    false
  end

  sig do
    params(
        validate: T.nilable(T::Boolean),
        touch: T.nilable(T::Boolean),
        block: T.nilable(T.proc.void),
      )
      .returns(TrueClass)
  end
  def save!(validate: nil, touch: nil, &block)
    true
  end

  sig do
    params(
        attributes: T::Hash[T.any(Symbol, String), T.untyped],
        returning:
          T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
        unique_by: T.nilable(T.untyped),
        record_timestamps: T.nilable(T::Boolean),
      )
      .returns(ActiveRecord::Result)
  end
  def insert(attributes, returning: nil, unique_by: nil, record_timestamps: nil)
    T.unsafe(nil)
  end

  sig do
    params(
        attributes: T::Hash[T.any(Symbol, String), T.untyped],
        returning:
          T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
        record_timestamps: T.nilable(T::Boolean),
      )
      .returns(ActiveRecord::Result)
  end
  def insert!(
    attributes,
    returning: T.unsafe(nil),
    record_timestamps: T.unsafe(nil)
  )
    T.unsafe(nil)
  end

  sig do
    params(
        attributes: T::Array[T::Hash[T.any(Symbol, String), T.untyped]],
        returning:
          T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
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
        returning:
          T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
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
        returning:
          T.nilable(T.any(FalseClass, T::Array[T.any(Symbol, String)])),
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

class ActiveRecord::ConnectionAdapters::TableDefinition
  extend T::Sig

  sig do
    params(
      column_name: T.any(String, Symbol),
      type: Symbol,
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      default: T.nilable(T.untyped),
      limit: T.nilable(Numeric),
      null: T::Boolean,
      precision: T.nilable(Numeric),
      scale: T.nilable(Numeric),
      collation: T.nilable(T.untyped),
      comment: T.nilable(String),
      if_not_exists: T::Boolean,
    ).void
  end
  def column(
    column_name,
    type,
    index: nil,
    default: nil,
    limit: nil,
    null: true,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: false
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
      default: T.nilable(T.untyped),
      limit: T.nilable(Numeric),
      null: T::Boolean,
      precision: T.nilable(Numeric),
      scale: T.nilable(Numeric),
      collation: T.nilable(T.untyped),
      comment: T.nilable(String),
      if_not_exists: T::Boolean,
    ).void
  end
  def column(
    column_name,
    type,
    index: nil,
    default: nil,
    limit: nil,
    null: true,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: false
  ); end

  sig do
    params(
        column_name: T.any(String, Symbol),
        type: T.nilable(Symbol),
        index:
          T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
        limit: T.nilable(Numeric),
        null: T.nilable(T::Boolean),
        precision: T.nilable(Numeric),
        scale: T.nilable(Numeric),
        collation: T.nilable(T.untyped),
        comment: T.nilable(String),
        if_not_exists: T.nilable(T::Boolean),
      )
      .returns(T::Boolean)
  end
  def column_exists?(
    column_name,
    type = nil,
    index: nil,
    limit: nil,
    null: nil,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: nil
  )
    false
  end

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

  sig do
    params(
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
  def timestamps(
    index: nil,
    limit: nil,
    null: false,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: false
  ); end

  sig do
    params(
      column_name: T.any(String, Symbol),
      type: Symbol,
      index:
        T.nilable(T.any(T::Boolean, T::Hash[T.any(Symbol, String), String])),
      limit: T.nilable(Numeric),
      null: T.nilable(T::Boolean),
      precision: T.nilable(Numeric),
      scale: T.nilable(Numeric),
      collation: T.nilable(T.untyped),
      comment: T.nilable(String),
      if_not_exists: T.nilable(T::Boolean),
    ).void
  end
  def change(
    column_name,
    type,
    index: nil,
    limit: nil,
    null: nil,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: nil
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
    limit: nil,
    null: true,
    precision: nil,
    scale: nil,
    collation: nil,
    comment: nil,
    if_not_exists: false
  ); end

  sig do
    params(
      column_name: T.nilable(T.any(Symbol, String)),
      column: T.nilable(T.any(Symbol, String, T::Array[T.any(Symbol, String)])),
      name: T.nilable(T.any(Symbol, String)),
      if_exists: T::Boolean,
      algorithm: T.nilable(Symbol),
    ).void
  end
  def remove_index(
    column_name = nil,
    column: nil,
    name: nil,
    if_exists: false,
    algorithm: nil
  ); end

  sig { void }
  def remove_timestamps; end

  sig do
    params(
      to_table: T.any(Symbol, String),
      column: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      name: T.nilable(T.any(Symbol, String)),
      on_delete: T.nilable(Symbol),
      on_update: T.nilable(Symbol),
      if_not_exists: T.nilable(T::Boolean),
      validate: T::Boolean,
      deferrable: T.any(T::Boolean, Symbol),
    ).void
  end
  def foreign_key(
    to_table,
    column: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    name: T.unsafe(nil),
    on_delete: nil,
    on_update: nil,
    if_not_exists: nil,
    validate: true,
    deferrable: false
  ); end

  sig do
    params(
      to_table: T.any(Symbol, String),
      column: T.any(Symbol, String),
      primary_key: T.any(Symbol, String),
      name: T.nilable(T.any(Symbol, String)),
      on_delete: T.nilable(Symbol),
      on_update: T.nilable(Symbol),
      if_not_exists: T.nilable(T::Boolean),
      validate: T::Boolean,
      deferrable: T.any(T::Boolean, Symbol),
    ).void
  end
  def remove_foreign_key(
    to_table,
    column: T.unsafe(nil),
    primary_key: T.unsafe(nil),
    name: T.unsafe(nil),
    on_delete: nil,
    on_update: nil,
    if_not_exists: nil,
    validate: true,
    deferrable: false
  ); end

  sig do
    params(
      to_table: T.nilable(T.any(Symbol, String)),
      column: T.nilable(T.any(Symbol, String)),
      primary_key: T.nilable(T.any(Symbol, String)),
      name: T.nilable(T.any(Symbol, String)),
      on_delete: T.nilable(Symbol),
      on_update: T.nilable(Symbol),
      if_not_exists: T.nilable(T::Boolean),
      validate: T::Boolean,
      deferrable: T.any(T::Boolean, Symbol),
    ).void
  end
  def foreign_key_exists?(
    to_table = nil,
    column: nil,
    primary_key: nil,
    name: nil,
    on_delete: nil,
    on_update: nil,
    if_not_exists: nil,
    validate: true,
    deferrable: false
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

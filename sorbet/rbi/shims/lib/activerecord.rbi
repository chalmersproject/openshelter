# typed: strong

class ActiveRecord::Base
  extend ActiveRecord::Delegation::DelegateCache
  include ActiveRecord::DefineCallbacks
  include ActiveRecord::TouchLater
  include ActiveRecord::SecureToken
  include ActiveRecord::Suppressor

  sig do
    params(
      args: T.any(Symbol, T.proc.returns(T.untyped)),
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
  def self.after_create_commit(*args, if: nil, unless: nil, &block); end

  sig do
    params(
      args: T.any(Symbol, T.proc.returns(T.untyped)),
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
  def self.after_update_commit(*args, if: nil, unless: nil, &block); end

  sig do
    params(
      args: T.any(Symbol, T.proc.returns(T.untyped)),
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
  def self.after_destroy_commit(*args, if: nil, unless: nil, &block); end

  sig { params(attribute: T.any(Symbol, String)).void }
  def self.has_secure_token(attribute); end
end

module ActiveRecord::SecureToken
  def generate_unique_secure_token; end
  def has_secure_token(attribute = T.unsafe(nil)); end

  mixes_in_class_methods ::ActiveRecord::SecureToken::ClassMethods
end

module ActiveRecord::Suppressor
  mixes_in_class_methods ::ActiveRecord::Suppressor::ClassMethods
end

module ActiveRecord::DefineCallbacks
  extend ::ActiveSupport::Concern

  include ::ActiveSupport::Callbacks
  include ::ActiveModel::Validations::Callbacks

  mixes_in_class_methods ::ActiveRecord::DefineCallbacks::ClassMethods
end

module ActiveRecord::DefineCallbacks::ClassMethods
  include ::ActiveModel::Callbacks
end

module ActiveRecord::TouchLater
  extend ::ActiveSupport::Concern

  def touch(*names, time: T.unsafe(nil)); end
end

class ActiveRecord::Migration::Compatibility::V5_0 < ActiveRecord::Migration::Compatibility::V5_1
end
class ActiveRecord::Migration::Compatibility::V5_1 < ActiveRecord::Migration::Compatibility::V5_2
end

class ActiveRecord::Migration::Compatibility::V5_2 < ActiveRecord::Migration::Compatibility::V6_0
end

class ActiveRecord::Migration::Compatibility::V6_0 < ActiveRecord::Migration::Compatibility::V6_1
end
class ActiveRecord::Migration::Compatibility::V6_1 < ActiveRecord::Migration::Compatibility::V7_0
end

ActiveRecord::Migration::Compatibility::V7_0 = ActiveRecord::Migration::Current

# Method definitions are documented here:
# https://api.rubyonrails.org/v7.0/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html
class ActiveRecord::Migration::Current < ActiveRecord::Migration
  # Tables

  # https://github.com/rails/rails/blob/v7.0.0.alpha2/activerecord/lib/active_record/connection_adapters/abstract/schema_statements.rb#L154-L295
  sig do
    params(
      table_name: T.any(String, Symbol),
      comment: T.untyped,
      id: T.any(T::Boolean, Symbol),
      primary_key: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      options: T.untyped,
      temporary: T::Boolean,
      force: T.any(T::Boolean, Symbol),
      if_not_exists: T::Boolean,
      as: T.untyped,
      blk:
        T.nilable(
          T
            .proc
            .params(
              t: ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition,
            )
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
    if_not_exists: false,
    as: nil,
    &blk
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      bulk: T::Boolean,
      blk:
        T
          .proc
          .params(t: ActiveRecord::ConnectionAdapters::PostgreSQL::Table)
          .void,
    ).void
  end
  def change_table(table_name, bulk: false, &blk); end

  sig do
    params(table_name: T.any(String, Symbol), new_name: T.any(String, Symbol))
      .void
  end
  def rename_table(table_name, new_name); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      force: T.any(T::Boolean, Symbol),
      if_exists: T::Boolean,
      blk:
        T.nilable(
          T
            .proc
            .params(
              t: ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition,
            )
            .void,
        ),
    ).void
  end
  def drop_table(table_name, force: false, if_exists: false, &blk); end

  # Join Tables

  sig do
    params(
      table_1: T.any(String, Symbol),
      table_2: T.any(String, Symbol),
      column_options: T.untyped,
      table_name: T.any(String, Symbol),
      temporary: T.untyped,
      force: T::Boolean,
      blk:
        T.nilable(
          T
            .proc
            .params(
              t: ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition,
            )
            .void,
        ),
    ).void
  end
  def create_join_table(
    table_1,
    table_2,
    column_options: {},
    table_name: nil,
    temporary: nil,
    force: false,
    &blk
  ); end

  sig do
    params(
      table_1: T.any(String, Symbol),
      table_2: T.any(String, Symbol),
      options: T.untyped,
      blk:
        T.nilable(
          T
            .proc
            .params(
              t: ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition,
            )
            .void,
        ),
    ).void
  end
  def drop_join_table(table_1, table_2, options = {}, &blk); end

  # Columns

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      type: T.any(String, Symbol),
      limit: T.untyped,
      default: T.untyped,
      null: T::Boolean,
      precision: Integer,
      scale: Integer,
      comment: String,
      array: T::Boolean,
    ).void
  end
  def add_column(
    table_name,
    column_name,
    type,
    limit: nil,
    default: nil,
    null: nil,
    precision: nil,
    scale: nil,
    comment: nil,
    array: nil
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      type: T.any(String, Symbol),
      limit: T.untyped,
      default: T.untyped,
      null: T::Boolean,
      precision: Integer,
      scale: Integer,
      comment: String,
    ).void
  end
  def change_column(
    table_name,
    column_name,
    type,
    limit: nil,
    default: nil,
    null: nil,
    precision: nil,
    scale: nil,
    comment: nil
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      null: T::Boolean,
      default: T.untyped,
    ).void
  end
  def change_column_null(table_name, column_name, null, default = nil); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      default_or_changes: T.untyped,
    ).void
  end
  def change_column_default(table_name, column_name, default_or_changes); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      new_column_name: T.any(String, Symbol),
    ).void
  end
  def rename_column(table_name, column_name, new_column_name); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol),
      type: T.nilable(T.any(String, Symbol)),
      options: T.untyped,
    ).void
  end
  def remove_column(table_name, column_name, type = nil, options = {}); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_names: T.any(String, Symbol),
    ).void
  end
  def remove_columns(table_name, *column_names); end

  # Foreign Keys

  sig do
    params(
      from_table: T.any(String, Symbol),
      to_table: T.any(String, Symbol),
      column: T.any(String, Symbol),
      primary_key: T.any(String, Symbol),
      name: T.any(String, Symbol),
      on_delete: Symbol,
      on_update: Symbol,
      validate: T::Boolean,
    ).void
  end
  def add_foreign_key(
    from_table,
    to_table,
    column: nil,
    primary_key: nil,
    name: nil,
    on_delete: nil,
    on_update: nil,
    validate: true
  ); end

  sig do
    params(
      from_table: T.any(String, Symbol),
      to_table: T.nilable(T.any(String, Symbol)),
      column: T.any(String, Symbol),
      primary_key: T.any(String, Symbol),
      name: T.any(String, Symbol),
      on_delete: Symbol,
      on_update: Symbol,
      validate: T::Boolean,
    ).void
  end
  def remove_foreign_key(
    from_table,
    to_table = nil,
    column: nil,
    primary_key: nil,
    name: nil,
    on_delete: nil,
    on_update: nil,
    validate: true
  ); end

  sig do
    params(
        from_table: T.any(String, Symbol),
        to_table: T.any(String, Symbol),
        name: T.any(String, Symbol),
        column: T.any(String, Symbol),
        options: T.untyped,
      )
      .returns(T::Boolean)
  end
  def foreign_key_exists?(
    from_table,
    to_table = nil,
    name: nil,
    column: nil,
    **options
  ); end

  sig { params(table_name: T.any(String, Symbol)).returns(T::Array[T.untyped]) }
  def foreign_keys(table_name); end

  # Indices

  sig do
    params(
      table_name: T.any(String, Symbol),
      column_name: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      using: T.untyped,
      unique: T::Boolean,
      where: T.untyped,
      order: T.untyped,
      name: T.any(String, Symbol),
      length: T.untyped,
      opclass: T.untyped,
      type: T.untyped,
      internal: T.untyped,
      algorithm: T.untyped,
    ).void
  end
  def add_index(
    table_name,
    column_name,
    using: nil,
    unique: false,
    where: nil,
    order: nil,
    name: nil,
    length: nil,
    opclass: nil,
    type: nil,
    internal: nil,
    algorithm: nil
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      column: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      using: T.untyped,
      unique: T::Boolean,
      where: T.untyped,
      order: T.untyped,
      name: T.any(String, Symbol),
      length: T.untyped,
      opclass: T.untyped,
      type: T.untyped,
      internal: T.untyped,
      algorithm: T.untyped,
    ).void
  end
  def remove_index(
    table_name,
    column,
    using: nil,
    unique: false,
    where: nil,
    order: nil,
    name: nil,
    length: nil,
    opclass: nil,
    type: nil,
    internal: nil,
    algorithm: nil
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      old_name: T.any(String, Symbol),
      new_name: T.any(String, Symbol),
    ).void
  end
  def rename_index(table_name, old_name, new_name); end

  sig do
    params(
        table_name: T.any(String, Symbol),
        column_name: T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
        options: T.untyped,
      )
      .returns(T::Boolean)
  end
  def index_exists?(table_name, column_name, options = {}); end

  sig do
    params(table_name: T.any(String, Symbol), index_name: T.any(String, Symbol))
      .returns(T::Boolean)
  end
  def index_name_exists?(table_name, index_name); end

  sig do
    params(
        table_name: T.any(String, Symbol),
        column_name: T.any(String, Symbol),
        type: T.nilable(Symbol),
        options: T.untyped,
      )
      .returns(T::Boolean)
  end
  def column_exists?(table_name, column_name, type = nil, options = {}); end

  sig { params(table_name: T.any(String, Symbol)).returns(T::Array[T.untyped]) }
  def indexes(table_name); end

  # References

  sig do
    params(
      table_name: T.any(String, Symbol),
      ref_name: T.any(String, Symbol),
      type: T.any(String, Symbol),
      index: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      foreign_key: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      polymorphic: T::Boolean,
      null: T.untyped,
    ).void
  end
  def add_reference(
    table_name,
    ref_name,
    type: :bigint,
    index: true,
    foreign_key: false,
    polymorphic: false,
    null: nil
  ); end

  sig do
    params(
      table_name: T.any(String, Symbol),
      ref_name: T.any(String, Symbol),
      type: T.any(String, Symbol),
      index: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      foreign_key: T.any(T::Boolean, T::Hash[Symbol, T.untyped]),
      polymorphic: T::Boolean,
      null: T.untyped,
    ).void
  end
  def remove_reference(
    table_name,
    ref_name,
    type: :bigint,
    index: true,
    foreign_key: false,
    polymorphic: false,
    null: nil
  ); end

  # Timestamps

  sig { params(table_name: T.any(String, Symbol), options: T.untyped).void }
  def add_timestamps(table_name, options = {}); end

  sig { params(table_name: T.any(String, Symbol), options: T.untyped).void }
  def remove_timestamps(table_name, options = {}); end

  # Extensions

  sig { params(name: T.any(String, Symbol)).void }
  def enable_extension(name); end

  sig { params(name: T.any(String, Symbol)).void }
  def disable_extension(name); end

  # Miscellaneous

  sig { params(message: String, subitem: T.untyped).void }
  def say(message, subitem = false); end

  sig { params(message: String, blk: T.untyped).returns(T.untyped) }
  def say_with_time(message, &blk); end

  sig { params(blk: T.untyped).void }
  def suppress_messages(&blk); end

  sig { params(blk: T.proc.params(arg0: T.untyped).void).void }
  def reversible(&blk); end

  sig do
    params(
      migration_classes: T.untyped,
      blk: T.nilable(T.proc.params(arg0: T.untyped).void),
    ).void
  end
  def revert(*migration_classes, &blk); end

  sig { params(sql: String, name: T.nilable(String)).returns(T.untyped) }
  def execute(sql, name = nil); end
end

module ActiveRecord::Core
  sig { returns(T::Boolean) }
  def blank?; end

  sig { returns(T::Boolean) }
  def present?; end
end

module ActiveRecord::ConnectionHandling
  def current_role; end
end

# In ActiveRecord >= 6.1, the parent classes of these errors have changed.
# https://github.com/rails/rails/commit/730d810b0dd24e80c1e88d56a5e6960363a25dbb
module ActiveRecord
  class StatementTimeout < QueryAborted
  end
  class QueryCanceled < QueryAborted
  end
  class QueryAborted < StatementInvalid
  end
end
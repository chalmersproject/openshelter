# typed: strict
# frozen_string_literal: true

# module AbstractController::Callbacks::ClassMethods
#   extend T::Sig

#   sig do
#     params(
#       names: Symbol,
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def after_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   # append_after_action is an alias of after_action
#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def append_after_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   # append_around_action is an alias of around_action
#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def append_around_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   # append_before_action is an alias of before_action
#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def append_before_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def around_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def before_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def prepend_after_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def prepend_around_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#       block: T.nilable(T.proc.returns(T.untyped)),
#     ).void
#   end
#   def prepend_before_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true,
#     &block
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#     ).void
#   end
#   def skip_after_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#     ).void
#   end
#   def skip_around_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true
#   ); end

#   sig do
#     params(
#       names: T.any(Symbol, Proc),
#       except: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       only: T.nilable(T.any(Symbol, T::Array[Symbol])),
#       if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
#       raise: T::Boolean,
#     ).void
#   end
#   def skip_before_action(
#     *names,
#     except: nil,
#     only: nil,
#     if: nil,
#     unless: nil,
#     raise: true
#   ); end
# end

class ActionController::Parameters
  extend T::Sig

  sig { returns(T::Boolean) }
  def empty?
    false
  end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def has_key?(key)
    false
  end

  sig { params(value: T.untyped).returns(T::Boolean) }
  def has_value?(value)
    false
  end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def include?(key)
    false
  end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def key?(key)
    false
  end

  sig { returns(T::Array[T.untyped]) }
  def keys
    []
  end

  sig { returns(String) }
  def to_s
    ""
  end

  sig { params(value: T.untyped).returns(T::Boolean) }
  def value?(value)
    false
  end

  sig { returns(T::Array[T.untyped]) }
  def values
    []
  end
end

# class ActionPack::Http::Headers
#   extend T::Sig
#   extend T::Generic

#   include ::Enumerable

#   sig do
#     override
#       .params(block: T.proc.params(elem: Elem).returns(BasicObject))
#       .returns(NilClass)
#   end
#   def each(&block); end

#   Elem = type_member(:out)
# end

module ActionController::RequestForgeryProtection::ClassMethods
  extend T::Sig

  sig do
    params(
      only: T.any(T::Array[Symbol], Symbol),
      except: T.any(T::Array[Symbol], Symbol),
      if: T.untyped,
      unless: T.untyped,
      prepend: T::Boolean,
      with: Symbol,
      exception: T.untyped,
      reset_session: T.untyped,
      null_session: T.untyped,
    ).void
  end
  def protect_from_forgery(
    only: T.unsafe(nil),
    except: T.unsafe(nil),
    if: T.unsafe(nil),
    unless: T.unsafe(nil),
    prepend: false,
    with: :null_session,
    exception: T.unsafe(nil),
    reset_session: T.unsafe(nil),
    null_session: T.unsafe(nil)
  ); end
end

module ActionController::RequestForgeryProtection
  extend T::Sig

  sig { returns(Symbol) }
  def request_forgery_protection_token
    T.unsafe(nil)
  end

  sig { params(value: Symbol).void }
  def request_forgery_protection_token=(value); end
end

class ActionDispatch::Routing::Mapper
  Via = T.type_alias { T.any(Symbol, T::Array[Symbol]) }
  To =
    T.type_alias do
      T.any(
        String,
        Symbol,
        Class,
        Proc,
        T.proc.params(env: T.untyped).returns(T.untyped),
      )
    end
end

module ActionDispatch::Routing::Mapper::HttpHelpers
  extend T::Sig

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def delete(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def get(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def options(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def patch(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def post(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def put(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end
end

module ActionDispatch::Routing::Mapper::Resources
  extend T::Sig

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        path: T.any(String, Symbol),
        options: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def match(
    name,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    path: T.unsafe(nil),
    **options,
    &block
  ); end

  # These are set to T.unsafe(nil) because they do actually have values, but
  # they can't be determined statically. They take the value of path when no
  # explicit values are provided.
  sig do
    params(
        name: T.any(Symbol, String),
        path: T.any(Symbol, String),
        as: T.any(Symbol, String),
        module: T.any(Symbol, String),
        shallow_path: T.any(Symbol, String),
        shallow_prefix: T.any(Symbol, String),
        block: T.proc.void,
      )
      .returns(T.untyped)
  end
  def namespace(
    name,
    path: name,
    as: name,
    module: name,
    shallow_path: name,
    shallow_prefix: name,
    &block
  ); end

  sig do
    params(
        resources: T.any(String, Symbol),
        as: T.any(String, Symbol),
        controller: T.any(String, Symbol),
        concerns: T.any(Symbol, T::Array[Symbol]),
        param: Symbol,
        path_names: T.untyped,
        path: T.untyped,
        only: T.any(T::Array[T.any(String, Symbol)], String, Symbol),
        except: T.any(T::Array[T.any(String, Symbol)], String, Symbol),
        shallow: T::Boolean,
        shallow_path: String,
        shallow_prefix: String,
        format: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def resource(
    *resources,
    as: T.unsafe(nil),
    controller: T.unsafe(nil),
    concerns: T.unsafe(nil),
    param: T.unsafe(nil),
    path_names: T.unsafe(nil),
    path: T.unsafe(nil),
    only: T.unsafe(nil),
    except: T.unsafe(nil),
    shallow: false,
    shallow_path: T.unsafe(nil),
    shallow_prefix: T.unsafe(nil),
    format: T.unsafe(nil),
    &block
  ); end

  sig do
    params(
        resources: T.any(String, Symbol),
        as: T.any(String, Symbol),
        constraints: T.untyped,
        controller: T.any(String, Symbol),
        concerns: T.any(Symbol, T::Array[Symbol]),
        defaults: T.untyped,
        param: Symbol,
        path_names: T.untyped,
        path: T.untyped,
        only: T.any(T::Array[T.any(String, Symbol)], String, Symbol),
        except: T.any(T::Array[T.any(String, Symbol)], String, Symbol),
        shallow: T::Boolean,
        shallow_path: String,
        shallow_prefix: String,
        format: T.untyped,
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def resources(
    *resources,
    as: T.unsafe(nil),
    constraints: T.unsafe(nil),
    controller: T.unsafe(nil),
    concerns: T.unsafe(nil),
    defaults: T.unsafe(nil),
    param: T.unsafe(nil),
    path_names: T.unsafe(nil),
    path: T.unsafe(nil),
    only: T.unsafe(nil),
    except: T.unsafe(nil),
    shallow: false,
    shallow_path: T.unsafe(nil),
    shallow_prefix: T.unsafe(nil),
    format: T.unsafe(nil),
    &block
  ); end

  # Technically, path doesn't have a default value set. However, this is
  # necessary to allow code like `root to: 'home#index'`.
  sig do
    params(
        path: T.nilable(String),
        controller: T.any(String, Symbol),
        action: T.any(String, Symbol),
        param: Symbol,
        module: T.any(String, Symbol),
        as: T.any(String, Symbol),
        via: ActionDispatch::Routing::Mapper::Via,
        to: ActionDispatch::Routing::Mapper::To,
        on: Symbol,
        constraints: T.untyped,
        defaults: T::Hash[T.untyped, T.untyped],
        anchor: T::Boolean,
        format: T.any(String, T::Boolean),
        block: T.untyped,
      )
      .returns(T.untyped)
  end
  def root(
    path = nil,
    controller: T.unsafe(nil),
    action: T.unsafe(nil),
    param: :id,
    module: T.unsafe(nil),
    as: T.unsafe(nil),
    via: T.unsafe(nil),
    to: T.unsafe(nil),
    on: T.unsafe(nil),
    constraints: T.unsafe(nil),
    defaults: T.unsafe(nil),
    anchor: true,
    format: T.unsafe(nil),
    &block
  ); end
end

class ActionController::Parameters
  extend T::Sig

  sig { returns(T::Hash[String, T.untyped]) }
  def to_unsafe_hash
    {}
  end
end

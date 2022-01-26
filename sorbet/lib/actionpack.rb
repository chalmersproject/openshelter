# typed: strict
# frozen_string_literal: true

module AbstractController::Callbacks::ClassMethods
  extend T::Sig

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def after_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  # append_after_action is an alias of after_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def append_after_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  # append_around_action is an alias of around_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def append_around_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  # append_before_action is an alias of before_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def append_before_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def around_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def before_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def prepend_after_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def prepend_around_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped)),
    ).void
  end
  def prepend_before_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true,
    &block
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
    ).void
  end
  def skip_after_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
    ).void
  end
  def skip_around_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true
  ); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
    ).void
  end
  def skip_before_action(
    *names,
    except: nil,
    only: nil,
    if: nil,
    unless: nil,
    raise: true
  ); end
end

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
      only: T.nilable(T.any(T::Array[Symbol], Symbol)),
      except: T.nilable(T.any(T::Array[Symbol], Symbol)),
      if: T.nilable(T.untyped),
      unless: T.nilable(T.untyped),
      prepend: T::Boolean,
      with: T.nilable(Symbol),
      exception: T.nilable(T.untyped),
      reset_session: T.nilable(T.untyped),
      null_session: T.nilable(T.untyped),
    ).void
  end
  def protect_from_forgery(
    only: nil,
    except: nil,
    if: nil,
    unless: nil,
    prepend: false,
    with: nil,
    exception: nil,
    reset_session: nil,
    null_session: nil
  ); end
end

module ActionDispatch::Routing::Mapper::HttpHelpers
  extend T::Sig

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def delete(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to:
          T.nilable(
            T.any(
              String,
              Symbol,
              T.proc.params(arg0: T.untyped).returns(T.untyped),
            ),
          ),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def get(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to:
          T.nilable(
            T.any(
              String,
              Symbol,
              T.proc.params(arg0: T.untyped).returns(T.untyped),
            ),
          ),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def options(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def patch(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def post(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def put(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
    &block
  ); end
end

module ActionDispatch::Routing::Mapper::Resources
  extend T::Sig

  sig do
    params(
        name: T.any(String, Symbol, T::Hash[String, String]),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        path: T.nilable(T.any(String, Symbol)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def match(
    name,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    path: nil,
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
        as: T.nilable(T.any(String, Symbol)),
        controller: T.nilable(T.any(String, Symbol)),
        concerns: T.nilable(T.any(Symbol, T::Array[Symbol])),
        param: T.nilable(Symbol),
        path_names: T.nilable(T.untyped),
        path: T.nilable(T.untyped),
        only: T.nilable(T.any(T::Array[T.any(String, Symbol)], String, Symbol)),
        except:
          T.nilable(T.any(T::Array[T.any(String, Symbol)], String, Symbol)),
        shallow: T::Boolean,
        shallow_path: T.nilable(String),
        shallow_prefix: T.nilable(String),
        format: T.nilable(T.untyped),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def resource(
    *resources,
    as: nil,
    controller: nil,
    concerns: nil,
    param: nil,
    path_names: nil,
    path: nil,
    only: nil,
    except: nil,
    shallow: false,
    shallow_path: nil,
    shallow_prefix: nil,
    format: nil,
    &block
  ); end

  sig do
    params(
        resources: T.any(String, Symbol),
        as: T.nilable(T.any(String, Symbol)),
        constraints: T.nilable(T.untyped),
        controller: T.nilable(T.any(String, Symbol)),
        concerns: T.nilable(T.any(Symbol, T::Array[Symbol])),
        defaults: T.nilable(T.untyped),
        param: T.nilable(Symbol),
        path_names: T.nilable(T.untyped),
        path: T.nilable(T.untyped),
        only: T.nilable(T.any(T::Array[T.any(String, Symbol)], String, Symbol)),
        except:
          T.nilable(T.any(T::Array[T.any(String, Symbol)], String, Symbol)),
        shallow: T::Boolean,
        shallow_path: T.nilable(String),
        shallow_prefix: T.nilable(String),
        format: T.nilable(T.untyped),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def resources(
    *resources,
    as: nil,
    constraints: nil,
    controller: nil,
    concerns: nil,
    defaults: nil,
    param: nil,
    path_names: nil,
    path: nil,
    only: nil,
    except: nil,
    shallow: false,
    shallow_path: nil,
    shallow_prefix: nil,
    format: nil,
    &block
  ); end

  # Technically, path doesn't have a default value set. However, this is
  # necessary to allow code like `root to: 'home#index'`.
  sig do
    params(
        path: T.nilable(String),
        controller: T.nilable(T.any(String, Symbol)),
        action: T.nilable(T.any(String, Symbol)),
        param: T.nilable(Symbol),
        module: T.nilable(T.any(String, Symbol)),
        as: T.nilable(T.any(String, Symbol)),
        via: T.nilable(T.any(Symbol, T::Array[Symbol])),
        to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
        on: T.nilable(Symbol),
        constraints: T.nilable(T.untyped),
        defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
        anchor: T::Boolean,
        format: T.nilable(T.any(String, T::Boolean)),
        block: T.nilable(T.untyped),
      )
      .returns(T.untyped)
  end
  def root(
    path = nil,
    controller: nil,
    action: nil,
    param: :id,
    module: nil,
    as: nil,
    via: nil,
    to: nil,
    on: nil,
    constraints: nil,
    defaults: nil,
    anchor: true,
    format: nil,
    &block
  ); end
end

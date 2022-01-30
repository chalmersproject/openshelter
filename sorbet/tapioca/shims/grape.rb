# typed: ignore
# frozen_string_literal: true

module Grape::DSL::InsideRoute
  extend T::Sig

  sig do
    params(
        params: T::Hash[T.any(Symbol, String), T.untyped],
        include_parent_namespace: T::Boolean,
      )
      .returns(T::Hash[T.any(Symbol, String), T.untyped])
  end
  def declared(params, include_parent_namespace: true)
    {}
  end
end

module Grape::DSL::Routing::ClassMethods
  extend T::Sig

  RouteNamespace = T.type_alias { T.nilable(T.any(Symbol, String)) }
  RouteMethods = T.type_alias { T.any(Symbol, T::Array[Symbol]) }
  RoutePaths = T.type_alias { T.any(String, T::Array[String]) }
  RouteOptions = T.type_alias { T::Hash[Symbol, T.untyped] }

  sig do
    params(
      methods: RouteMethods,
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def route(methods, paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def get(paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def head(paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def options(paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def patch(paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def post(paths = ["/"], route_options = {}, &block); end

  sig do
    params(
      paths: RoutePaths,
      route_options: RouteOptions,
      block: T.proc.bind(Grape::Endpoint).void,
    ).void
  end
  def put(paths = ["/"], route_options = {}, &block); end

  sig do
    params(space: RouteNamespace, options: RouteOptions, block: T.proc.void)
      .void
  end
  def namespace(space = nil, options = {}, &block); end

  sig do
    params(space: RouteNamespace, options: RouteOptions, block: T.proc.void)
      .void
  end
  def group(space = nil, options = {}, &block); end

  sig do
    params(space: RouteNamespace, options: RouteOptions, block: T.proc.void)
      .void
  end
  def segment(space = nil, options = {}, &block); end

  sig do
    params(space: RouteNamespace, options: RouteOptions, block: T.proc.void)
      .void
  end
  def resource(space = nil, options = {}, &block); end

  sig do
    params(space: RouteNamespace, options: RouteOptions, block: T.proc.void)
      .void
  end
  def resources(space = nil, options = {}, &block); end
end

module Grape::DSL::Validations::ClassMethods
  extend T::Sig

  sig { params(block: T.proc.void.bind(Grape::DSL::Parameters)).void }
  def params(&block); end
end

module Grape::DSL::Parameters
  extend T::Sig

  # sig do
  #   params(
  #     attrs: Symbol,
  #     type: T.nilable(Class),
  #     types: T.nilable(T::Array[Class]),
  #     desc: T.nilable(String),
  #     default: T.nilable(T.untyped),
  #     values: T.nilable(T::Array[T.untyped]),
  #     using: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.untyped]]),
  #     except: T.nilable(T::Array[Symbol]),
  #     coerce_with:
  #       T.nilable(
  #         T.any(
  #           Class,
  #           Proc,
  #           T.proc.params(value: T.untyped).returns(T.untyped),
  #         ),
  #       ),
  #   ).void
  # end
  # def requires(
  #   *attrs,
  #   type: nil,
  #   types: nil,
  #   desc: nil,
  #   default: nil,
  #   values: nil,
  #   using: nil,
  #   except: nil,
  #   coerce_with: nil
  # ); end

  # sig do
  #   params(
  #     attrs: Symbol,
  #     type: T.nilable(Class),
  #     types: T.nilable(T::Array[Class]),
  #     desc: T.nilable(String),
  #     default: T.nilable(T.untyped),
  #     values: T.nilable(T::Array[T.untyped]),
  #     using: T.nilable(T::Hash[Symbol, T::Hash[Symbol, T.untyped]]),
  #     except: T.nilable(T::Array[Symbol]),
  #     coerce_with:
  #       T.nilable(
  #         T.any(
  #           Class,
  #           Proc,
  #           T.proc.params(value: T.untyped).returns(T.untyped),
  #         ),
  #       ),
  #   ).void
  # end
  # def optional(
  #   *attrs,
  #   type: nil,
  #   types: nil,
  #   desc: nil,
  #   default: nil,
  #   values: nil,
  #   using: nil,
  #   except: nil,
  #   coerce_with: nil
  # ); end

  # sig { params(names: Symbol).void }
  # def use(*names); end

  # sig { params(attrs: Symbol).void }
  # def all_or_none_of(*attrs); end

  # sig { params(attrs: Symbol).void }
  # def at_least_one_of(*attrs); end

  # sig { params(attrs: Symbol).void }
  # def exactly_one_of(*attrs); end

  # sig { params(attrs: Symbol).void }
  # def mutually_exclusive(*attrs); end

  # sig { params(attrs: Symbol, block: T.proc.void).void }
  # def given(*attrs, &block); end
end

class Grape::Endpoint
  extend T::Sig

  sig { returns(T::Hash[T.any(Symbol, String), T.untyped]) }
  def params
    {}
  end
end

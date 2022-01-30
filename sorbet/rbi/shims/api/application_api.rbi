# typed: ignore

class ApplicationAPI
  include ::Grape::Middleware::Auth::DSL
  include ::Grape::DSL::Configuration
  include ::Grape::DSL::Validations
  include ::Grape::DSL::Callbacks
  include ::Grape::DSL::Helpers
  include ::Grape::DSL::Middleware
  include ::Grape::DSL::RequestResponse
  include ::Grape::DSL::Routing
  include ::Grape::DSL::Routing::ClassMethods
  include ::Grape::DSL::API

  extend ::Grape::Middleware::Auth::DSL::ClassMethods
  extend ::Grape::DSL::Settings
  extend ::Grape::DSL::Logger
  extend ::Grape::DSL::Desc
  extend ::Grape::DSL::Configuration::ClassMethods
  extend ::Grape::DSL::Validations::ClassMethods
  extend ::Grape::DSL::Callbacks::ClassMethods
  extend ::Grape::DSL::Helpers::ClassMethods
  extend ::Grape::DSL::Middleware::ClassMethods
  extend ::Grape::DSL::RequestResponse::ClassMethods
  extend ::Grape::DSL::Routing::ClassMethods
  extend ::SwaggerRouting
  extend ::SwaggerDocumentationAdder

  # Builds the routes from the defined endpoints, effectively compiling
  # this API into a usable form.
  def initialize; end

  # Handle a request. See Rack documentation for what `env` is.
  def call(env); end

  # Some requests may return a HTTP 404 error if grape cannot find a matching
  # route. In this case, Grape::Router adds a X-Cascade header to the response
  # and sets it to 'pass', indicating to grape's parents they should keep
  # looking for a matching route on other resources.
  #
  # In some applications (e.g. mounting grape on rails), one might need to trap
  # errors from reaching upstream. This is effectivelly done by unsetting
  # X-Cascade. Default :cascade is true.
  def cascade?; end

  # Returns the value of attribute router.
  def router; end
end

module ApplicationAPI::Helpers
  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def env; end

  sig { returns(Grape::Request) }
  def request; end

  include Grape::DSL::InsideRoute
end

# Bind routing class methods to ApplicationAPIInstance.
module Grape::DSL::Routing::ClassMethods
  RouteNamespace = T.type_alias { T.nilable(T.any(Symbol, String)) }
  RouteOptions = T.type_alias { T::Hash[Symbol, T.untyped] }

  sig do
    params(
      space: RouteNamespace,
      options: RouteOptions,
      block: T.proc.void.bind(ApplicationAPI),
    ).void
  end
  def namespace(space = nil, options = {}, &block); end

  sig do
    params(
      space: RouteNamespace,
      options: RouteOptions,
      block: T.proc.void.bind(ApplicationAPI),
    ).void
  end
  def group(space = nil, options = {}, &block); end

  sig do
    params(
      space: RouteNamespace,
      options: RouteOptions,
      block: T.proc.void.bind(ApplicationAPI),
    ).void
  end
  def segment(space = nil, options = {}, &block); end

  sig do
    params(
      space: RouteNamespace,
      options: RouteOptions,
      block: T.proc.void.bind(ApplicationAPI),
    ).void
  end
  def resource(space = nil, options = {}, &block); end

  sig do
    params(
      space: RouteNamespace,
      options: RouteOptions,
      block: T.proc.void.bind(ApplicationAPI),
    ).void
  end
  def resources(space = nil, options = {}, &block); end
end

class Grape::Endpoint
  include ApplicationAPI::Helpers
end

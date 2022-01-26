# typed: strong

# https://github.com/rails/rails/blob/5-2-stable/actionpack/lib/action_controller.rb
module ActionController; end

# https://api.rubyonrails.org/classes/AbstractController/Callbacks/ClassMethods.html
module AbstractController::Callbacks::ClassMethods
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def after_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  # append_after_action is an alias of after_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def append_after_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  # append_around_action is an alias of around_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def append_around_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  # append_before_action is an alias of before_action
  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def append_before_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def around_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def before_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def prepend_after_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def prepend_around_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean,
      block: T.nilable(T.proc.returns(T.untyped))
    ).void
  end
  def prepend_before_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true, &block); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean
    ).void
  end
  def skip_after_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean
    ).void
  end
  def skip_around_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true); end

  sig do
    params(
      names: T.any(Symbol, Proc),
      except: T.nilable(T.any(Symbol, T::Array[Symbol])),
      only: T.nilable(T.any(Symbol, T::Array[Symbol])),
      if: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      unless: T.nilable(T.any(Symbol, T::Array[Symbol], Proc)),
      raise: T::Boolean
    ).void
  end
  def skip_before_action(*names, except: nil, only: nil, if: nil, unless: nil, raise: true); end
end

class AbstractController::Base
end

module AbstractController::Helpers
  mixes_in_class_methods(::AbstractController::Helpers::ClassMethods)
end

module AbstractController::Helpers::ClassMethods; end

module AbstractController::UrlFor
  mixes_in_class_methods(::AbstractController::UrlFor::ClassMethods)
end

module AbstractController::UrlFor::ClassMethods; end

class ActionController::Base < ::ActionController::Metal
  include(::ActiveSupport::Rescuable)
end

class ActionController::API
  MODULES = T.let(T.unsafe(nil), T::Array[T.untyped])
end

ActionController::Base::MODULES = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionController::Base::PROTECTED_IVARS = T.let(T.unsafe(nil), T::Set[T.untyped])

module ActionController::Flash::ClassMethods
  sig { params(types: Symbol).void }
  def add_flash_types(*types); end
end

module ActionController::Helpers
  mixes_in_class_methods(::ActionController::Helpers::ClassMethods)
end

module ActionController::Helpers::ClassMethods
  sig { returns(ActionView::Base) }
  def helpers; end
end

class ActionController::InvalidAuthenticityToken < ::ActionController::ActionControllerError
end

class ActionController::InvalidCrossOriginRequest < ::ActionController::ActionControllerError
end

class ActionController::Metal < AbstractController::Base
  sig { returns(ActionController::Parameters) }
  def params; end

  def params=(val); end
  def performed?; end

  sig { returns(ActionDispatch::Request) }
  def request; end

  def request=(_); end
  def reset_session; end

  sig { returns(ActionDispatch::Response) }
  def response; end
end

# https://api.rubyonrails.org/classes/ActionController/MimeResponds.html
module ActionController::MimeResponds
  sig do
    params(
      mimes: T.nilable(Symbol),
      block: T.nilable(T.proc.params(arg0: ActionController::MimeResponds::Collector).void)
    ).void
  end
  def respond_to(*mimes, &block); end
end

ActionController::Renderer::DEFAULTS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionController::Renderer::IDENTITY = T.let(T.unsafe(nil), Proc)

ActionController::Renderer::RACK_KEY_TRANSLATION = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionController::Renderer::RACK_VALUE_TRANSLATION = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module ActionController::Renderers
  mixes_in_class_methods(::ActionController::Renderers::ClassMethods)
end

module ActionController::Renderers::ClassMethods; end

ActionController::Renderers::RENDERERS = T.let(T.unsafe(nil), T::Set[T.untyped])

module ActionController::Rendering
  mixes_in_class_methods(::ActionController::Rendering::ClassMethods)
end

module ActionController::Rendering::ClassMethods; end

ActionController::Rendering::RENDER_FORMATS_IN_PRIORITY = T.let(T.unsafe(nil), T::Array[T.untyped])

module ActionController::RequestForgeryProtection
  private

  # https://github.com/rails/rails/blob/5-2-stable/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L435
  sig { returns(T::Boolean) }
  def protect_against_forgery?; end

  # https://github.com/rails/rails/blob/5-2-stable/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L307
  sig { params(form_options: T::Hash[T.untyped, T.untyped]).returns(String)  }
  def form_authenticity_token(form_options: {}); end
end

module ActionController::RequestForgeryProtection::ClassMethods
  sig do
    params(
      only: T.any(T::Array[Symbol], Symbol),
      except: T.nilable(T.any(T::Array[Symbol], Symbol)),
      if: T.untyped,
      unless: T.untyped,
      prepend: T.untyped,
      with: T.nilable(Symbol),
      exception: T.untyped,
      reset_session: T.untyped,
      null_session: T.untyped
    ).void
  end
  def protect_from_forgery(only: nil, except: nil, if: nil, unless: nil, prepend: false, with: nil, exception: nil, reset_session: nil, null_session: nil); end

  sig { params(options: T::Hash[T.untyped, T.untyped]).void }
  def skip_forgery_protection(options = T.unsafe(nil)); end
end

ActionController::RespondToMismatchError::DEFAULT_MESSAGE = T.let(T.unsafe(nil), String)

ActionController::SessionOverflowError::DEFAULT_MESSAGE = T.let(T.unsafe(nil), String)

module ActionController::StrongParameters
  sig { returns(ActionController::Parameters) }
  def params; end
end

class ActionController::UnknownFormat < ::ActionController::ActionControllerError
end

class ActionController::UnknownHttpMethod < ::ActionController::ActionControllerError
end

class ActionController::UrlGenerationError < ::ActionController::ActionControllerError
end

module ActionDispatch::Http::Parameters
  sig { returns(ActionController::Parameters) }
  def parameters(); end

  # params is an alias of parameters
  sig { returns(ActionController::Parameters) }
  def params(); end
end

# these methods are delegated out, sorbet gets confused with them
class ActionDispatch::IntegrationTest
  sig { returns(ActionDispatch::Flash::FlashHash) }
  def flash; end

  sig { returns(ActionDispatch::Request::Session) }
  def session; end
end

class ActionDispatch::RemoteIp::IpSpoofAttackError < ::StandardError
end

ActionDispatch::RemoteIp::TRUSTED_PROXIES = T.let(T.unsafe(nil), T::Array[T.untyped])

class ActionDispatch::Request
  # Provides access to the request's HTTP headers, for example:
  #
  # ```ruby
  # request.headers["Content-Type"] # => "text/plain"
  # ```
  sig { returns(ActionDispatch::Http::Headers) }
  def headers; end

  # Returns a `String` with the last requested path including their params.
  #
  # ```ruby
  # # get '/foo'
  # request.original_fullpath # => '/foo'
  #
  # # get '/foo?bar'
  # request.original_fullpath # => '/foo?bar'
  # ```
  sig { returns(String) }
  def original_fullpath; end

  # Returns the `String` full path including params of the last URL requested.
  #
  # ```ruby
  # # get "/articles"
  # request.fullpath # => "/articles"
  #
  # # get "/articles?page=2"
  # request.fullpath # => "/articles?page=2"
  # ```
  sig { returns(String) }
  def fullpath; end

  # Returns the original request URL as a `String`.
  #
  # ```ruby
  # # get "/articles?page=2"
  # request.original_url # => "http://www.example.com/articles?page=2"
  # ```
  sig { returns(String) }
  def original_url; end

  # The `String` MIME type of the request.
  #
  # ```
  # # get "/articles"
  # request.media_type # => "application/x-www-form-urlencoded"
  # ```
  sig { returns(String) }
  def media_type; end

  # Returns the content length of the request as an integer.
  sig { returns(Integer) }
  def content_length; end

  # Returns the IP address of client as a `String`.
  sig { returns(String) }
  def ip; end

  # Returns the IP address of client as a `String`,
  # usually set by the RemoteIp middleware.
  sig { returns(String) }
  def remote_ip; end

  # Returns the unique request id, which is based on either the X-Request-Id header that can
  # be generated by a firewall, load balancer, or web server or by the RequestId middleware
  # (which sets the action_dispatch.request_id environment variable).
  #
  # This unique ID is useful for tracing a request from end-to-end as part of logging or debugging.
  # This relies on the Rack variable set by the ActionDispatch::RequestId middleware.
  sig { returns(String) }
  def request_id; end

  # Returns true if the request has a header matching the given key parameter.
  #
  # ```ruby
  # request.key? :ip_spoofing_check # => true
  # ```
  sig { params(key: Symbol).returns(T::Boolean) }
  def key?(key); end

  # True if the request came from localhost, 127.0.0.1, or ::1.
  sig { returns(T::Boolean) }
  def local?; end
end

ActionDispatch::Response::CONTENT_TYPE = T.let(T.unsafe(nil), String)

ActionDispatch::Response::CONTENT_TYPE_PARSER = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Response::LOCATION = T.let(T.unsafe(nil), String)

ActionDispatch::Response::NO_CONTENT_CODES = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionDispatch::Response::NullContentTypeHeader = T.let(T.unsafe(nil), ActionDispatch::Response::ContentTypeHeader)

ActionDispatch::Response::SET_COOKIE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Request::HTTP_IF_MODIFIED_SINCE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Request::HTTP_IF_NONE_MATCH = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::DATE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::DEFAULT_CACHE_CONTROL = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::LAST_MODIFIED = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::MUST_REVALIDATE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::NO_CACHE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::PRIVATE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::PUBLIC = T.let(T.unsafe(nil), String)

ActionDispatch::Http::Cache::Response::SPECIAL_KEYS = T.let(T.unsafe(nil), T::Set[T.untyped])

ActionDispatch::Http::ContentDisposition::RFC_5987_ESCAPED_CHAR = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::ContentDisposition::TRADITIONAL_ESCAPED_CHAR = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::FilterParameters::ENV_MATCH = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionDispatch::Http::FilterParameters::KV_RE = T.let(T.unsafe(nil), String)

ActionDispatch::Http::FilterParameters::NULL_ENV_FILTER = T.let(T.unsafe(nil), ActiveSupport::ParameterFilter)

ActionDispatch::Http::FilterParameters::NULL_PARAM_FILTER = T.let(T.unsafe(nil), ActiveSupport::ParameterFilter)

ActionDispatch::Http::FilterParameters::PAIR_RE = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::FilterRedirect::FILTERED = T.let(T.unsafe(nil), String)

# ActionDispatch::Http::Headers::CGI_VARIABLES = T.let(T.unsafe(nil), T::Set[T.untyped])

# ActionDispatch::Http::Headers::DEFAULT = T.let(T.unsafe(nil), Object)

# ActionDispatch::Http::Headers::HTTP_HEADER = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::MimeNegotiation::BROWSER_LIKE_ACCEPTS = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::MimeNegotiation::RESCUABLE_MIME_FORMAT_ERRORS = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionDispatch::Http::ParameterFilter = ActiveSupport::ParameterFilter

module ActionDispatch::Http::Parameters
  mixes_in_class_methods(::ActionDispatch::Http::Parameters::ClassMethods)
end

module ActionDispatch::Http::Parameters::ClassMethods; end

ActionDispatch::Http::Parameters::DEFAULT_PARSERS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionDispatch::Http::Parameters::PARAMETERS_KEY = T.let(T.unsafe(nil), String)

class ActionDispatch::Http::Parameters::ParseError < ::StandardError
end

ActionDispatch::Http::URL::HOST_REGEXP = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::URL::IP_HOST_REGEXP = T.let(T.unsafe(nil), Regexp)

ActionDispatch::Http::URL::PROTOCOL_REGEXP = T.let(T.unsafe(nil), Regexp)

# ActionDispatch::Http::Headers::CGI_VARIABLES = T.let(T.unsafe(nil), T::Set[T.untyped])

# ActionDispatch::Http::Headers::DEFAULT = T.let(T.unsafe(nil), Object)

# ActionDispatch::Http::Headers::HTTP_HEADER = T.let(T.unsafe(nil), Regexp)

class ActionController::Parameters
  sig { params(other: T.any(String, ActionController::Parameters)).returns(T::Boolean) }
  def ==(other); end

  sig { params(key: T.any(String, Symbol), value: T.untyped).void }
  def []=(key, value); end

  sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
  def always_permitted_parameters; end

  sig { params(obj: T.nilable(T::Array[T.any(String, Symbol)])).void }
  def always_permitted_parameters=(obj); end

  # sig { params(options: T.untyped).returns(T.untyped) }
  # def as_json(options = nil); end

  sig { returns(T.untyped) }
  def deep_dup; end

  sig { params(key: T.any(String, Symbol), block: T.untyped).returns(T.untyped) }
  def delete(key, &block); end

  sig { params(keys: T.any(String, Symbol)).returns(T.untyped) }
  def dig(*keys); end

  sig { params(block: T.untyped).returns(T.untyped) }
  def each_pair(&block); end

  # each is an alias of each_pair
  sig { params(block: T.untyped).returns(T.untyped) }
  def each(&block); end

  sig { returns(T::Boolean) }
  def empty?; end

  sig { params(keys: T.any(String, Symbol)).returns(ActionController::Parameters) }
  def except(*keys); end

  sig { params(keys: T.any(String, Symbol)).returns(T.untyped) }
  def extract!(*keys); end

  sig { params(key: T.any(String, Symbol), args: T.untyped).returns(T.untyped) }
  def fetch(key, *args); end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def has_key?(key); end

  sig { params(value: T.untyped).returns(T::Boolean) }
  def has_value?(value); end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def include?(key); end

  # sig { params(parameters: T.untyped).void }
  # def initialize(parameters = nil); end

  sig { returns(String) }
  def inspect; end

  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def key?(key); end

  sig { returns(T::Array[T.untyped]) }
  def keys; end

  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def merge!(other_hash); end

  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def merge(other_hash); end

  sig { returns(T.untyped) }
  def parameters; end

  sig { returns(T.self_type) }
  def permit!; end

  # You can pass _a lot_ of stuff to permit, so filters is left untyped for now.
  sig { params(filters: T.untyped).returns(ActionController::Parameters) }
  def permit(*filters); end

  sig { params(new_permitted: T.untyped).void }
  def permitted=(new_permitted); end

  sig { returns(T::Boolean) }
  def permitted?; end

  sig { params(block: T.untyped).returns(T.untyped) }
  def reject!(&block); end

  # delete_if is an alias of reject!
  sig { params(block: T.untyped).returns(T.untyped) }
  def delete_if(&block); end

  sig { params(block: T.untyped).returns(T.untyped) }
  def reject(&block); end

  sig do
    params(
      key: T.any(String, Symbol),
    ).returns(
      T.nilable(
        T.any(
          String,
          Numeric,
          ActionController::Parameters,
        ),
      ),
    )
  end
  def [](key); end

  sig do
    params(
      key: T.any(
        String,
        Symbol,
        T::Array[T.any(String, Symbol)],
      ),
    ).returns(
      T.any(
        String,
        Numeric,
        T::Array[T.untyped],
        ActionController::Parameters,
      ),
    )
  end
  def require(key); end

  # required is an alias of require
  sig do
    params(
      key: T.any(
        String,
        Symbol,
        T::Array[T.any(String, Symbol)],
      ),
    ).returns(
      T.any(
        String,
        Numeric,
        T::Array[T.untyped],
        ActionController::Parameters,
      ),
    )
  end
  def required(key); end

  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def reverse_merge!(other_hash); end

  # with_defaults! is an alias of reverse_merge!
  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def with_defaults!(other_hash); end

  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def reverse_merge(other_hash); end

  # with_defaults is an alias of reverse_merge
  sig { params(other_hash: T.untyped).returns(ActionController::Parameters) }
  def with_defaults(other_hash); end

  sig { params(block: T.untyped).returns(T.nilable(ActionController::Parameters)) }
  def select!(&block); end

  # keep_if is an alias of select!
  sig { params(block: T.untyped).returns(T.nilable(ActionController::Parameters)) }
  def keep_if(&block); end

  sig { params(block: T.untyped).returns(ActionController::Parameters) }
  def select(&block); end

  sig { returns(T.any(Symbol, T::Boolean)) }
  def self.action_on_unpermitted_parameters; end

  sig { params(obj: T.any(Symbol, T::Boolean)).void }
  def self.action_on_unpermitted_parameters=(obj); end

  sig { returns(T::Array[T.any(String, Symbol)]) }
  def self.always_permitted_parameters; end

  sig { params(obj: T::Array[T.any(String, Symbol)]).void }
  def self.always_permitted_parameters=(obj); end

  sig { returns(T::Boolean) }
  def self.permit_all_parameters; end

  sig { params(obj: T::Boolean).void }
  def self.permit_all_parameters=(obj); end

  sig { params(keys: T.any(String, Symbol)).returns(ActionController::Parameters) }
  def slice!(*keys); end

  sig { params(keys: T.any(String, Symbol)).returns(ActionController::Parameters) }
  def slice(*keys); end

  sig { returns(ActiveSupport::HashWithIndifferentAccess) }
  def to_h; end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def to_hash; end

  # to_param is an alias of to_query
  sig { params(args: String).returns(T.nilable(String)) }
  def to_param(*args); end

  sig { params(args: String).returns(T.nilable(String)) }
  def to_query(*args); end

  sig { returns(String) }
  def to_s; end

  sig { returns(ActiveSupport::HashWithIndifferentAccess) }
  def to_unsafe_h; end

  # to_unsafe_hash is an alias of to_unsafe_h
  sig { returns(ActiveSupport::HashWithIndifferentAccess) }
  def to_unsafe_hash; end

  sig { params(block: T.untyped).returns(ActionController::Parameters) }
  def transform_keys!(&block); end

  sig { params(block: T.untyped).returns(ActionController::Parameters) }
  def transform_keys(&block); end

  sig { returns(ActionController::Parameters) }
  def transform_values!; end

  sig { returns(ActionController::Parameters) }
  def transform_values; end

  sig { params(value: T.untyped).returns(T::Boolean) }
  def value?(value); end

  sig { returns(T::Array[T.untyped]) }
  def values; end

  sig { params(keys: T.any(String, Symbol)).returns(T.untyped) }
  def values_at(*keys); end
end

class ActionDispatch::Routing::RouteSet
  sig { params(blk: T.proc.bind(ActionDispatch::Routing::Mapper).void).void }
  def draw(&blk); end
end

module ActionDispatch::Routing::Mapper::HttpHelpers
  # get, put, patch, post, and delete all have the same arguments as
  # ActionDispatch::Routing::Mapper::Resources#match
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
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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
      to: T.nilable(T.any(String, Symbol, T.proc.params(arg0: T.untyped).returns(T.untyped))),
      on: T.nilable(Symbol),
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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
      to: T.nilable(T.any(String, T.proc.returns(T.untyped))),
      on: T.nilable(Symbol),
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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
  sig { params(name: T.untyped).returns(T.untyped) }
  def action_path(name); end

  sig { params(block: T.untyped).returns(T.untyped) }
  def collection(&block); end

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
      constraints: T.untyped,
      defaults: T.nilable(T::Hash[T.untyped, T.untyped]),
      anchor: T::Boolean,
      format: T.nilable(T.any(String, T::Boolean)),
      path: T.nilable(T.any(String, Symbol)),
      block: T.untyped
    ).returns(T.untyped)
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

  sig { params(block: T.untyped).returns(T.untyped) }
  def member(&block); end

  # # These are set to T.unsafe(nil) because they do actually have values, but they
  # # can't be determined statically. They take the value of path when no explicit
  # # values are provided.
  # sig do
  #   params(
  #     path: T.untyped,
  #     as: T.untyped,
  #     module: T.untyped,
  #     shallow_path: T.untyped,
  #     shallow_prefix: T.untyped,
  #     block: T.untyped
  #   ).returns(T.untyped)
  # end
  # def namespace(
  #   path,
  #   as: T.unsafe(nil),
  #   module: T.unsafe(nil),
  #   shallow_path: T.unsafe(nil),
  #   shallow_prefix: T.unsafe(nil),
  #   &block
  # ); end

  sig do
    params(
      resources: T.any(String, Symbol),
      as: T.nilable(T.any(String, Symbol)),
      controller: T.nilable(T.any(String, Symbol)),
      concerns: T.nilable(T.any(Symbol, T::Array[Symbol])),
      param: T.nilable(Symbol),
      path_names: T.untyped,
      path: T.untyped,
      only: T.nilable(T.any(
        T::Array[T.any(String, Symbol)],
        String,
        Symbol
      )),
      except: T.nilable(T.any(
        T::Array[T.any(String, Symbol)],
        String,
        Symbol
      )),
      shallow: T::Boolean,
      shallow_path: T.nilable(String),
      shallow_prefix: T.nilable(String),
      format: T.untyped,
      block: T.untyped
    ).returns(T.untyped)
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
      constraints: T.untyped,
      controller: T.nilable(T.any(String, Symbol)),
      concerns: T.nilable(T.any(Symbol, T::Array[Symbol])),
      defaults: T.untyped,
      param: T.nilable(Symbol),
      path_names: T.untyped,
      path: T.untyped,
      only: T.nilable(T.any(
        T::Array[T.any(String, Symbol)],
        String,
        Symbol
      )),
      except: T.nilable(T.any(
        T::Array[T.any(String, Symbol)],
        String,
        Symbol
      )),
      shallow: T::Boolean,
      shallow_path: T.nilable(String),
      shallow_prefix: T.nilable(String),
      format: T.untyped,
      block: T.untyped
    ).returns(T.untyped)
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

  # # Technically, path doesn't have a default value set. However, this is
  # # necessary to allow code like `root to: 'home#index'`.
  # sig { params(path: T.nilable(String), to: T.untyped, as: T.nilable(Symbol)).returns(T.untyped) }
  # def root(path = T.unsafe(nil), to: nil, as: nil); end

  sig { returns(T.untyped) }
  def shallow; end

  sig { returns(T::Boolean) }
  def shallow?; end
end

Mime::ALL = T.let(T.unsafe(nil), Mime::AllType)

Mime::EXTENSION_LOOKUP = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

Mime::LOOKUP = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

Mime::SET = T.let(T.unsafe(nil), Mime::Mimes)

Mime::Type::MIME_NAME = T.let(T.unsafe(nil), String)

Mime::Type::MIME_PARAMETER = T.let(T.unsafe(nil), String)

Mime::Type::MIME_PARAMETER_KEY = T.let(T.unsafe(nil), String)

Mime::Type::MIME_PARAMETER_VALUE = T.let(T.unsafe(nil), String)

Mime::Type::MIME_REGEXP = T.let(T.unsafe(nil), Regexp)

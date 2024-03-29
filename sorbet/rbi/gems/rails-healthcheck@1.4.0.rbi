# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails-healthcheck` gem.
# Please instead update this file by running `bin/tapioca gem rails-healthcheck`.

module ActionController::Base::HelperMethods
  include ::Turbo::DriveHelper
  include ::Turbo::FramesHelper
  include ::Turbo::IncludesHelper
  include ::Turbo::StreamsHelper
  include ::Turbo::Streams::ActionHelper
  include ::ActionText::ContentHelper
  include ::ActionText::TagHelper
  include ::Hotwire::Livereload::LivereloadTagsHelper
  include ::Loaf::OptionsValidator
  include ::Loaf::ViewExtensions

  def _breadcrumbs(*args, **_arg1, &block); end
  def alert(*args, **_arg1, &block); end
  def allowed_to?(*args, **_arg1, &block); end
  def authorized_scope(*args, **_arg1, &block); end
  def combined_fragment_cache_key(*args, **_arg1, &block); end
  def content_security_policy?(*args, **_arg1, &block); end
  def content_security_policy_nonce(*args, **_arg1, &block); end
  def cookies(*args, **_arg1, &block); end
  def current_user(*args, **_arg1, &block); end
  def devise_controller?(*args, **_arg1, &block); end
  def form_authenticity_token(*args, **_arg1, &block); end
  def notice(*args, **_arg1, &block); end
  def protect_against_forgery?(*args, **_arg1, &block); end
  def signed_in?(*args, **_arg1, &block); end
  def user_session(*args, **_arg1, &block); end
  def user_signed_in?(*args, **_arg1, &block); end
  def view_cache_dependencies(*args, **_arg1, &block); end
  def warden(*args, **_arg1, &block); end
end

module Healthcheck
  private

  def check; end
  def configuration; end
  def configure; end
  def custom!(controller); end
  def custom?; end
  def routes(router); end

  class << self
    def check; end
    def configuration; end

    # @yield [configuration]
    def configure; end

    def custom!(controller); end

    # @return [Boolean]
    def custom?; end

    def routes(router); end
  end
end

Healthcheck::CONTROLLER_ACTION = T.let(T.unsafe(nil), String)

class Healthcheck::Check
  # @return [Check] a new instance of Check
  def initialize(name, block); end

  # Returns the value of attribute block.
  def block; end

  # Sets the attribute block
  #
  # @param value the value to set the attribute block to.
  def block=(_arg0); end

  def execute!; end

  # Returns the value of attribute name.
  def name; end

  # Sets the attribute name
  #
  # @param value the value to set the attribute name to.
  def name=(_arg0); end
end

class Healthcheck::Checker
  # @return [Checker] a new instance of Checker
  def initialize; end

  def check; end

  # @return [Boolean]
  def errored?; end

  # Returns the value of attribute errors.
  def errors; end

  # Sets the attribute errors
  #
  # @param value the value to set the attribute errors to.
  def errors=(_arg0); end

  private

  def execute(check); end
end

class Healthcheck::Configuration
  # @return [Configuration] a new instance of Configuration
  def initialize; end

  def add_check(name, block); end
  def checks; end
  def checks=(_arg0); end
  def clear!; end
  def custom; end
  def custom=(_arg0); end
  def error; end
  def error=(_arg0); end
  def method; end
  def method=(_arg0); end
  def route; end
  def route=(_arg0); end
  def success; end
  def success=(_arg0); end
  def verbose; end
  def verbose=(_arg0); end
end

Healthcheck::Configuration::SETTINGS = T.let(T.unsafe(nil), Array)

class Healthcheck::Engine < ::Rails::Engine
  class << self
    def __callbacks; end
  end
end

class Healthcheck::Error
  # @return [Error] a new instance of Error
  def initialize(name, exception, message); end

  # Returns the value of attribute exception.
  def exception; end

  # Sets the attribute exception
  #
  # @param value the value to set the attribute exception to.
  def exception=(_arg0); end

  # Returns the value of attribute message.
  def message; end

  # Sets the attribute message
  #
  # @param value the value to set the attribute message to.
  def message=(_arg0); end

  # Returns the value of attribute name.
  def name; end

  # Sets the attribute name
  #
  # @param value the value to set the attribute name to.
  def name=(_arg0); end
end

class Healthcheck::HealthchecksController < ::ActionController::Base
  def check; end

  private

  def _layout(lookup_context, formats); end
  def _layout_from_proc; end

  class << self
    def _routes; end
    def _wrapper_options; end
    def helpers_path; end
    def middleware_stack; end
  end
end

module Healthcheck::HealthchecksController::HelperMethods
  include ::Turbo::DriveHelper
  include ::Turbo::FramesHelper
  include ::Turbo::IncludesHelper
  include ::Turbo::StreamsHelper
  include ::Turbo::Streams::ActionHelper
  include ::ActionText::ContentHelper
  include ::ActionText::TagHelper
  include ::Hotwire::Livereload::LivereloadTagsHelper
  include ::Loaf::OptionsValidator
  include ::Loaf::ViewExtensions
  include ::ActionController::Base::HelperMethods
  include ::ApplicationHelper
  include ::DeviseHelper
  include ::PreviewHelper
end

module Healthcheck::Response; end

class Healthcheck::Response::Base
  # @return [Base] a new instance of Base
  def initialize(controller, checker); end

  def execute!; end

  private

  # @return [Boolean]
  def verbose?; end
end

class Healthcheck::Response::Error < ::Healthcheck::Response::Base
  def status; end
  def verbose; end
end

class Healthcheck::Response::Success < ::Healthcheck::Response::Base
  def status; end
  def verbose; end
end

class Healthcheck::Router
  class << self
    def mount(router); end
  end
end

Healthcheck::VERSION = T.let(T.unsafe(nil), String)

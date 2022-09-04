# typed: strict
# frozen_string_literal: true

class ApplicationResponder < ActionController::Responder
  extend T::Sig

  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder

  sig do
    params(
      controller: ActionController::Base,
      resources: T.untyped,
      options: T::Hash[Symbol, T.untyped],
    ).void
  end
  def initialize(controller, resources, options = {})
    options[:flash_now] = true if controller.send(:turbo_frame_request?)
    super(controller, resources, options)
  end
end

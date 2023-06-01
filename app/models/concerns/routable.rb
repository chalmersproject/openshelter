# typed: true
# frozen_string_literal: true

module Routable
  extend T::Sig
  extend T::Helpers

  abstract!
  requires_ancestor { ApplicationRecord }

  sig { overridable.returns(T.untyped) }
  def show_params
    self
  end

  sig { overridable.returns(T.untyped) }
  def edit_params
    [self, action: :edit]
  end

  sig { params(view: Symbol, options: T.untyped).returns(String) }
  def to_url(view = :show, **options)
    params_method = "#{view}_params"
    raise "missing method '#{params_method}'" unless respond_to?(params_method)
    params = Array.wrap(send(params_method))
    options.reverse_merge!(params.extract_options!)
    Rails.application.routes.url_helpers.polymorphic_url(params, options)
  end

  sig { params(view: Symbol, options: T.untyped).returns(String) }
  def to_path(view = :show, **options)
    to_url(view, routing_type: :path, **options)
  end
end

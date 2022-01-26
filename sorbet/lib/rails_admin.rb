# typed: strict
# frozen_string_literal: true

module RailsAdmin::ApplicationController::HelperMethods
  extend T::Sig

  sig { returns(T.untyped) }
  def _current_user; end

  sig { returns(T.untyped) }
  def _get_plugin_name; end
end

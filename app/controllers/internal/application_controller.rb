# typed: true
# frozen_string_literal: true

class Internal::ApplicationController < ApplicationController
  before_action :authorize_user!

  private

  sig { void }
  def authorize_user!
    render("pages/401", status: :unauthorized) unless admin?
  end
end

# typed: strict
# frozen_string_literal: true

module RouteConstraints
  extend T::Sig
  extend ActiveSupport::Concern

  class Authenticated
    extend T::Sig

    sig { params(admin_only: T::Boolean).void }
    def initialize(admin_only: false)
      @admin_only = T.let(admin_only, T::Boolean)
    end

    sig { params(request: T.untyped).returns(T::Boolean) }
    def matches?(request)
      user = Session.for(request)&.user
      return false if user.blank?
      return false if @admin_only && !user.admin?
      true
    end
  end

  sig { params(admin_only: T::Boolean).returns(Authenticated) }
  def authenticated(admin_only: false)
    Authenticated.new(admin_only: admin_only)
  end
end

class ActionDispatch::Routing::Mapper
  include RouteConstraints
end

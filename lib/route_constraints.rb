# typed: strict
# frozen_string_literal: true

module RouteConstraints
  extend T::Sig
  extend ActiveSupport::Concern

  class Authenticated
    extend T::Sig

    sig { params(mode: T.any(T::Boolean, Symbol)).void }
    def initialize(mode)
      @mode = T.let(mode, T.any(T::Boolean, Symbol))
    end

    sig { params(request: T.untyped).returns(T::Boolean) }
    def matches?(request)
      user = Session.for(request)&.user
      case @mode
      when :admin
        return user&.admin? || false
      when true
        return user.present?
      when false
        return user.blank?
      end
      false
    end
  end

  sig { params(mode: T.any(T::Boolean, Symbol)).returns(Authenticated) }
  def authenticated(mode)
    Authenticated.new(mode)
  end
end

class ActionDispatch::Routing::Mapper
  include RouteConstraints
end

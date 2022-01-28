# typed: strict
# frozen_string_literal: true

module ApplicationResolverHelpers
  extend T::Sig
  extend T::Helpers

  include Kernel

  abstract!

  sig { abstract.returns(GraphQL::Query::Context) }
  def context; end

  sig { returns(Application) }
  def application
    T.cast(Rails.application, Application)
  end

  sig { returns(T.nilable(GraphqlController)) }
  def controller
    context[:controller]
  end

  sig { returns(GraphqlController) }
  def controller!
    controller = self.controller
    raise "Not executing within a controller" if controller.nil?
    controller
  end

  sig { returns(T.nilable(GraphqlChannel)) }
  def channel
    context[:channel]
  end

  sig { returns(GraphqlChannel) }
  def channel!
    channel = self.channel
    raise "Not executing within a channel" if channel.nil?
    channel
  end

  sig { returns(T.nilable(User)) }
  def current_user
    context[:current_user]
  end
end

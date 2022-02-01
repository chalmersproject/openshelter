# typed: strict
# frozen_string_literal: true

# TODO: Enable strict typing!
class GraphQLChannel < ApplicationCable::Channel
  extend T::Sig

  sig do
    params(
      connection: ApplicationCable::Connection,
      identifier: T.untyped,
      params: T::Hash[T.untyped, T.untyped],
    ).void
  end
  def initialize(connection, identifier, params = {})
    super(connection, identifier, params)
    @subscription_ids = T.let([], T::Array[String])
  end

  sig { void }
  def subscribed
    @subscription_ids = []
  end

  sig { params(params: T::Hash[String, T.untyped]).returns(T.untyped) }
  def execute(params)
    operation_name = params["operationName"]
    unless operation_name.nil?
      raise "operationName must be a String" unless operation_name.is_a?(String)
    end

    query = params["query"]
    unless query.nil?
      raise "query must be a String" unless query.is_a?(String)
    end

    variables = prepare_variables(params["variables"])
    extensions = prepare_extensions(params["extensions"])
    context = {
      extensions: extensions,
      current_user: current_user,
      channel: self,
    }

    result =
      Schema.execute(
        query,
        variables: variables,
        operation_name: operation_name,
        context: context,
      )
    payload = { result: result.to_h, more: result.subscription? }

    # Track the subscription here so we can remove it
    # on unsubscribe.
    if result.context[:subscription_id]
      @subscription_ids << result.context[:subscription_id]
    end

    transmit(payload)
  end

  sig { void }
  def unsubscribed
    @subscription_ids.each do |sid|
      Schema.subscriptions.delete_subscription(sid)
    end
  end

  private

  # Handle variables in form data, JSON body, or a blank value.
  sig { params(variables_param: T.untyped).returns(T::Hash[String, T.untyped]) }
  def prepare_variables(variables_param)
    ensure_hash(variables_param) do
      raise ArgumentError, "Unexpected variables parameter: #{variables_param}"
    end
  end

  # Handle extensions in form data, JSON body, or a blank value.
  sig do
    params(extensions_param: T.untyped).returns(T::Hash[String, T.untyped])
  end
  def prepare_extensions(extensions_param)
    ensure_hash(extensions_param) do
      raise ArgumentError,
            "Unexpected extensions parameter: #{extensions_param}"
    end
  end

  sig do
    params(param: T.untyped, block: T.proc.void)
      .returns(T::Hash[String, T.untyped])
  end
  def ensure_hash(param, &block)
    case param
    when String
      param.present? ? JSON.parse(param) || {} : {}
    when Hash
      param
    when ActionController::Parameters
      # GraphQL-Ruby will validate name and type of incoming extensions.
      param.to_unsafe_hash
    when nil
      {}
    else
      yield
    end
  end
end

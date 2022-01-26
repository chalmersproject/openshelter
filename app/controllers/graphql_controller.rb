# typed: strict
# frozen_string_literal: true

class GraphqlController < ApplicationController
  extend T::Sig

  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  sig { returns(T.untyped) }
  def execute
    operation_name = params[:operationName]
    unless operation_name.nil?
      raise "operationName must be a String" unless operation_name.is_a?(String)
    end

    query = params[:query]
    unless query.nil?
      raise "query must be a String" unless query.is_a?(String)
    end

    variables = prepare_variables(params[:variables])

    context = {
      # current_user: current_user
    }

    result =
      Schema.execute(
        query,
        variables: variables,
        context: context,
        operation_name: operation_name,
      )
    render(json: result)
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  sig { params(variables_param: BasicObject).returns(T.untyped) }
  def prepare_variables(variables_param)
    case variables_param
    when String
      variables_param.present? ? JSON.parse(variables_param) || {} : {}
    when Hash
      variables_param
    when ActionController::Parameters
      # GraphQL-Ruby will validate name and type of incoming variables.
      variables_param.to_unsafe_hash
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  sig { params(e: StandardError).returns(T.untyped) }
  def handle_error_in_development(e)
    logger.error(e.message)
    logger.error((e.backtrace || []).join("\n"))

    render(
      json: {
        errors: [{ message: e.message, backtrace: e.backtrace }],
        data: {},
      },
      status: :internal_server_error,
    )
  end
end

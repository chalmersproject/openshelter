# typed: strict
# frozen_string_literal: true

# TODO: Read up on other N+1 solutions:
# https://evilmartians.com/chronicles/how-to-graphql-with-ruby-rails-active-record-and-no-n-plus-one
class Schema < GraphQL::Schema
  extend T::Sig

  use GraphQL::Subscriptions::ActionCableSubscriptions
  use GraphQL::PersistedQueries, compiled_queries: true
  use GraphQL::Dataloader

  query Types::QueryType
  mutation Types::MutationType
  subscription Types::SubscriptionType

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  sig { params(err: T.untyped, context: T.untyped).returns(T.untyped) }
  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  # Resolve unions and interfaces:
  T::Sig::WithoutRuntime.sig do
    override
      .params(abstract_type: T.untyped, obj: T.untyped, ctx: T.untyped)
      .returns(T.noreturn)
  end
  def self.resolve_type(abstract_type, obj, ctx)
    # TODO: Implement this method to return the correct GraphQL object type for
    # `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Return a string UUID for `object`:
  sig do
    params(object: T.untyped, type_definition: T.untyped, query_ctx: T.untyped)
      .returns(String)
  end
  def self.id_from_object(object, type_definition, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    object_id = object.to_global_id.to_s

    # Remove this redundant prefix to make IDs shorter:
    object_id = object_id.sub("gid://#{GlobalID.app}/", "")
    encoded_id = Base64.urlsafe_encode64(object_id)

    # Remove the "=" padding
    encoded_id = encoded_id.sub(/=+/, "")

    # Add a type hint
    type_hint = type_definition.graphql_name.first
    "#{type_hint}_#{encoded_id}"
  end

  # Given a string UUID, find the object:
  sig do
    params(encoded_id_with_hint: String, query_ctx: GraphQL::Query::Context)
      .returns(T.untyped)
  end
  def self.object_from_id(encoded_id_with_hint, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    # Split off the type hint
    _type_hint, encoded_id = encoded_id_with_hint.split("_", 2)
    raise "malformed ID" if encoded_id.nil?

    # Decode the ID
    id = Base64.urlsafe_decode64(encoded_id)

    # Rebuild it for Rails then find the object:
    full_global_id = "gid://#{GlobalID.app}/#{id}"
    GlobalID::Locator.locate(full_global_id)
  end
end

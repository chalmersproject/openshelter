# typed: strict
# frozen_string_literal: true

module GraphQL
  class << self
    extend T::Sig

    sig do
      params(graphql_string: String, tracer: T.untyped)
        .returns(GraphQL::Language::Nodes::Document)
    end
    def parse(graphql_string, tracer: T.unsafe(nil))
      T.unsafe(nil)
    end
  end
end

class GraphQL::Schema
  class << self
    extend T::Sig

    sig do
      params(
          query_string: T.nilable(String),
          query: T.nilable(String),
          document: T.untyped,
          context: T.nilable(T::Hash[T.untyped, T.untyped]),
          variables: T.nilable(T::Hash[String, T.untyped]),
          operation_name: T.nilable(String),
          root_value: ::Object,
          kwargs: T.untyped,
        )
        .returns(T::Hash[String, T.untyped])
    end
    def execute(
      query_string = nil,
      query: nil,
      document: nil,
      context: nil,
      variables: nil,
      operation_name: nil,
      root_value: nil,
      **kwargs
    )
      {}
    end
  end
end

class GraphQL::Schema::Enum
  class << self
    extend T::Sig

    # Define a value for this enum
    sig do
      params(
        graphql_name: T.any(String, Symbol),
        positional_description: String,
        value: Object,
        description: T.nilable(String),
        deprecation_reason: T.nilable(String),
        block: T.untyped,
      ).void
    end
    def value(
      graphql_name,
      positional_description = "",
      value: nil,
      description: nil,
      deprecation_reason: nil,
      &block
    ); end

    # Possible values for this enum
    sig do
      params(context: T.untyped)
        .returns(T::Hash[String, GraphQL::Schema::EnumValue])
    end
    def values(context = nil)
      {}
    end
  end
end

module GraphQL::Schema::Interface
  extend T::Helpers

  mixes_in_class_methods ::GraphQL::Schema::Member::RelayShortcuts
end

module GraphQL::Schema::Member::HasFields
  extend T::Sig

  sig do
    params(
      args: T.untyped,
      kwargs: T.untyped,
      block: T.nilable(T.proc.void.bind(T.class_of(GraphQL::Schema::Resolver))),
    ).void
  end
  def field(*args, **kwargs, &block); end
end

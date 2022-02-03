# typed: strong

module GraphQL
  class << self
    sig do
      params(graphql_string: String, tracer: T.untyped)
        .returns(GraphQL::Language::Nodes::Document)
    end
    def parse(graphql_string, tracer: T.unsafe(nil)); end
  end
end

class GraphQL::Backtrace
  include ::Enumerable
  extend ::Forwardable
end

class GraphQL::Schema
  class << self
    sig do
      params(query_str: T.nilable(String), kwargs: T.untyped)
        .returns(GraphQL::Query::Result)
    end
    def execute(query_str = T.unsafe(nil), **kwargs); end
  end
end

# class GraphQL::Schema::Enum < ::GraphQL::Schema::Member
#   class << self
#     sig do
#       params(
#         graphql_name: T.any(String, Symbol),
#         positional_description: String,
#         value: Object,
#         description: String,
#         deprecation_reason: String,
#         block: T.untyped,
#       ).void
#     end
#     def value(
#       graphql_name,
#       positional_description = "",
#       value: nil,
#       description: nil,
#       deprecation_reason: nil,
#       &block
#     ); end

#     sig { returns(T::Hash[String, GraphQL::Schema::EnumValue]) }
#     def values; end
#   end
# end

class GraphQL::Schema::InputObject < ::GraphQL::Schema::Member
  sig { returns(GraphQL::Query::Context) }
  def context; end
end

class GraphQL::Schema::Object < ::GraphQL::Schema::Member
  extend ::GraphQL::Schema::Member::HasFields

  sig { returns(GraphQL::Query::Context) }
  def context; end
end

class GraphQL::Schema::Resolver
  extend ::GraphQL::Schema::Member::BaseDSLMethods

  sig { returns(GraphQL::Query::Context) }
  def context; end
end

class GraphQL::Schema::Member
  extend ::GraphQL::Schema::Member::BaseDSLMethods
end

module GraphQL::Schema::Member::HasFields
  sig do
    params(
        args: T.untyped,
        kwargs: T.untyped,
        block: T.nilable(T.proc.bind(GraphQL::Schema::Field).void),
      )
      .returns(T.untyped)
  end
  def field(*args, **kwargs, &block); end
end

module GraphQL::Schema::Member::HasArguments
  def argument(*args, **kwargs, &block); end
end

module GraphQL::Schema::Member::HasFields
  def field_class(new_field_class = nil); end
end

module GraphQL::Schema::Member::BaseDSLMethods
  sig { params(new_description: String).returns(T.nilable(String)) }
  def description(new_description = T.unsafe(nil)); end
end

module GraphQL::Schema::Interface
  mixes_in_class_methods ::GraphQL::Schema::Member::BaseDSLMethods
  mixes_in_class_methods ::GraphQL::Schema::Member::HasFields
  mixes_in_class_methods ::GraphQL::Schema::Member::RelayShortcuts
end

class GraphQL::Schema::Mutation < ::GraphQL::Schema::Resolver
  extend ::GraphQL::Schema::Member::HasFields
end

class GraphQL::Schema::Subscription < ::GraphQL::Schema::Resolver
  extend ::GraphQL::Schema::Member::HasFields
end

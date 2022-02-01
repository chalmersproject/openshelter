# typed: strict
# frozen_string_literal: true

module Types
  class BaseField < GraphQL::Schema::Field
    argument_class BaseArgument
  end
end

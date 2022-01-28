# typed: strict
# frozen_string_literal: true

# class Array
#   extend T::Sig

#   sig { returns(String) }
#   def to_s
#     ""
#   end
# end

# class Date
#   extend T::Sig

#   sig { returns(String) }
#   def to_s
#     ""
#   end
# end

# class Time
#   extend T::Sig

#   sig { returns(String) }
#   def to_s
#     ""
#   end

#   sig do
#     params(
#         seconds: T.any(Time, Numeric),
#         microseconds_with_frac: Numeric,
#         fractional_precision: Symbol,
#       )
#       .returns(Time)
#   end
#   def self.at(
#     seconds,
#     microseconds_with_frac = T.unsafe(nil),
#     fractional_precision = T.unsafe(nil)
#   )
#     T.unsafe(nil)
#   end
# end

# class DateTime
#   extend T::Sig

#   sig { returns(String) }
#   def to_s
#     ""
#   end
# end

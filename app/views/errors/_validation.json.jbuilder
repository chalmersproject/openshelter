# typed: false
# frozen_string_literal: true

json.message @message
json.params @params
json.errors do
  @errors.each do |key, value|
    # Only reveal first value in error set.
    json.set! key, value.first
  end
end

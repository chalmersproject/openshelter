class ApiKey < ApplicationRecord
  belongs_to :bearer, polymorphic: true
end

# typed: true
# frozen_string_literal: true

# Ignore legacy models.
Rails.autoloaders.each do |autoloader|
  autoloader.ignore(Rails.root.join("app/models/legacy"))
end

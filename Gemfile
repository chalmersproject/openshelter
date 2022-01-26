# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.1"

# Administrate app with Rails Admin
gem "rails_admin", [">= 3.0.0.beta2", "< 4"]

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use Postgres as the database for Active Record
gem "pg", "~> 1.2.3"
gem "pg_search", "~> 2.3.6"

# Expose a GraphQL API
gem "graphql", "~> 1.13.6"

# Render GraphiQL
gem "sprockets", "~> 4.0.2"
gem "sprockets-rails", "~> 3.4.2", require: "sprockets/railtie"
gem "sassc", "~> 2.4.0"
gem "sassc-rails", "~> 2.1.2"
gem "graphiql-rails", "~> 1.8.0"

# Authenticate users with Devise
gem "devise", "~> 4.8.1"

# Authorize actions with Pundit
gem "pundit", "~> 2.1.1"

# Audit model changes with PaperTrail
gem "paper_trail", "~> 12.2.0"
# gem "paper_trail-association_tracking", "~> 2.1.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword] # rubocop:disable Layout/LineLength
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images] # rubocop:disable Layout/LineLength
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
# gem "rack-cors"

# Use Rack proxy to forward requests to Remix
gem "rack-proxy", "~> 0.7.2"

# Use Semantic Logger for logging
gem "semantic_logger", "~> 4.9.0"
gem "rails_semantic_logger", "~> 4.9.0"
gem "amazing_print", "~> 1.4.0"

# Check types with Sorbet
gem "sorbet", "~> 0.5.9542", group: :development
gem "sorbet-runtime", "~> 0.5.9542"
gem "spoom", group: :development, require: false
gem "tapioca", group: :development, require: false

# Make Sorbet happy (third party dependencies)
gem "safe_type", group: :development, require: false

# Format code with Prettier
gem "prettier", group: :development, require: false

# Check code with Rubocop
gem "rubocop", group: :development, require: false
gem "rubocop-shopify", group: :development, require: false
gem "rubocop-sorbet", group: :development, require: false
gem "rubocop-rails", group: :development, require: false
gem "rubocop-graphql", group: :development, require: false
gem "unparser", group: :development, require: false

# Enable autoloading with zeitwerk
gem "zeitwerk", group: :development

# Enable runtime debugging
gem "debug", group: %i[development test], platforms: %i[mri mingw x64_mingw]
gem "pry", group: %i[development test]
gem "pry-rails", group: :development

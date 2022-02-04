# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare Ruby version.
ruby "3.0.3"

# Bundle Rails!
gem "rails", "~> 7.0.1"

# Deliver assets with Sprockets (for rails_admin).
gem "sprockets", "~> 4.0.2"
gem "sprockets-rails", "~> 3.4.2"
gem "sassc-rails", "~> 2.1"
gem "sassc", "~> 2.4"

# Expose a GraphQL API.
gem "graphql", "~> 1.13.6"
gem "graphql-persisted_queries", "~> 1.4"
gem "graphql-rails_logger", "~> 1.2"
gem "graphiql-rails", "~> 1.8.0"

# Bundle additional ActiveModel validators.
gem "active_storage_validations", "~> 0.9.6"
gem "email_validator", "~> 2.2"
gem "validate_url", "~> 1.0"
gem "phonelib", "~> 0.6.55"

# Expose an admin interface with Trestle.
gem "trestle",
    github: "TrestleAdmin/trestle",
    ref: "be01ce94429df4d5e2db98c393f3151d8cfe250c"
gem "turbolinks", "~> 5.2"

# Use the Puma web server [https://github.com/puma/puma].
gem "puma", "~> 5.0"

# Run background jobs with Good Job.
gem "good_job", "~> 2.9"

# Use Postgres as the database for Active Record.
gem "pg", "~> 1.2.3"
gem "pg_search", "~> 2.3.6"

# Authenticate users with Authlogic.
gem "authlogic", "~> 6.4.1"
gem "scrypt", "~> 2.0.2"
gem "scanf", "~> 1.0.0"

# Authorize actions with Action Policy.
gem "action_policy", "~> 0.6.0"
gem "action_policy-graphql", "~> 0.5.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder].
# gem "jbuilder", "~> 2.11"

# Use Redis adapter to run Action Cable in production.
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis
# [https://github.com/rails/kredis].
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem.
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants
# [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]. # rubocop:disable Layout/LineLength
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible.
# gem "rack-cors"

# Check types with Sorbet.
gem "sorbet", "~> 0.5.9542", group: :development
gem "sorbet-runtime", "~> 0.5.9542"
gem "spoom", group: :development, require: false
gem "tapioca", group: :development, require: false

# Make Sorbet happy (third party dependencies).
gem "safe_type", group: :development, require: false

# Format code with Prettier.
gem "prettier", group: :development, require: false

# Check code with Rubocop.
gem "rubocop", group: :development, require: false
gem "rubocop-shopify", group: :development, require: false
gem "rubocop-sorbet", group: :development, require: false
gem "rubocop-rails", group: :development, require: false
gem "rubocop-graphql", group: :development
gem "unparser", group: :development, require: false

# Annotate models and routes.
gem "annotate",
    github: "dabit/annotate_models",
    branch: "rails-7",
    group: :development

# Enable runtime debugging with Pry and Debug.
# gem "debug", group: %i[development test], platforms: %i[mri mingw x64_mingw]
gem "pry", group: %i[development test]
gem "pry-rails", group: :development




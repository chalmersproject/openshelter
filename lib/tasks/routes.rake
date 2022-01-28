# NOTE: This task is required for the `annotate` gem to work properly.

# rubocop:disable Rails/RakeEnvironment
# typed: false
# frozen_string_literal: true

task :routes do
  puts `bundle exec rails routes`
end

# rubocop:disable Rails/RakeEnvironment
# frozen_string_literal: true

# Clear existing build task to add our own.
task("javascript:build").clear

namespace :javascript do
  desc "Build your JavaScript bundle"
  task :build do
    command = "yarn build"
    command += " --minify" if Rails.env.production?
    unless system("yarn install && #{command}")
      raise "jsbundling-rails: Command build failed, ensure yarn is " \
              "installed and `#{command}` runs without errors"
    end
  end

  namespace :build do
    desc "Continuously build your JavaScript bundle as files change"
    task :watch do
      command = "yarn build --watch"
      unless system("yarn install && #{command}")
        raise "Command javascript:build:watch failed, ensure yarn is " \
                "installed and `#{command}` runs without errors"
      end
    end
  end
end

# rubocop:disable Rails/RakeEnvironment
# frozen_string_literal: true

# Clear existing build task to add our own.
task("css:build").clear

namespace :css do
  desc "Build your CSS bundle"
  task :build do
    command = "yarn build:css"
    command += " --minify" if Rails.env.production?
    unless system("yarn install && #{command}")
      raise "jsbundling-rails: Command build failed, ensure yarn is " \
              "installed and `#{command}` runs without errors"
    end
  end

  namespace :build do
    desc "Continuously build your CSS bundle as files change"
    task :watch do
      command = "yarn build:css --watch"
      unless system("yarn install && #{command}")
        raise "Command css:build:watch failed, ensure yarn is installed and " \
                "`#{command}` runs without errors"
      end
    end
  end
end

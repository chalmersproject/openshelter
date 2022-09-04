# typed: true
# frozen_string_literal: true

# Remove manifest-related tasks, because we have a custom manifest that should
# not be overwritten (app/javascripts/controllers/index.js).
tasks = Rake.application.instance_variable_get(:"@tasks")
tasks.delete("stimulus:manifest:display")
tasks.delete("stimulus:manifest:update")

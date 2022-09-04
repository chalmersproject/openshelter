# typed: ignore
# frozen_string_literal: true

require "rails/generators/named_base"

class StimulusGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def copy_view_files
    @attribute = stimulus_attribute_value(controller_name)
    template(
      "controller.ts",
      "app/javascript/controllers/#{controller_name}_controller.ts",
    )
  end

  private

  def controller_name
    name.underscore.gsub(/_controller$/, "")
  end

  def stimulus_attribute_value(controller_name)
    controller_name.gsub(%r{\/}, "--").tr("_", "-")
  end
end

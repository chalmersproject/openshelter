# typed: ignore
# frozen_string_literal: true

require "rails/generators/abstract_generator"

module Stimulus
  module Generators
    class ComponentGenerator < Rails::Generators::NamedBase
      include ViewComponent::AbstractGenerator

      source_root File.expand_path("templates", __dir__)
      class_option :sidecar, type: :boolean, default: false

      def copy_view_files
        @attribute = stimulus_attribute_value(controller_name)
        template("controller.ts", destination)
      end

      private

      def controller_name
        name.underscore.gsub(/_controller$/, "") + "-component"
      end

      def stimulus_attribute_value(controller_name)
        controller_name.gsub(%r{\/}, "--").tr("_", "-")
      end

      def destination
        if sidecar?
          File.join(
            component_path,
            class_path,
            "#{file_name}_component",
            "#{file_name}_component_controller.ts",
          )
        else
          File.join(
            component_path,
            class_path,
            "#{file_name}_component_controller.ts",
          )
        end
      end
    end
  end
end

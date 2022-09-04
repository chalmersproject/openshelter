# typed: false
# frozen_string_literal: true

module Rails
  # Ensure generators defined in 'lib/generators' are prioritized over
  # generators in 'lib/rails/generators'.
  module Generators
    class << self
      private

      def lookup_paths
        @lookup_paths ||= %w[generators rails/generators]
      end
    end
  end
end

class ActionController::Base
  attr_accessor :template

  # Expose the currently rendered template path.
  def template_path
    template&.virtual_path
  end
end

class ActionView::TemplateRenderer
  # Write the currently rendered template to controller.template.
  def render_template(view, template, layout_name, locals)
    template_controller = view.controller.is_a?(ActionController::Base)
    view.controller.template = template if template_controller
    rendered_template =
      render_with_layout(view, template, layout_name, locals) do |layout|
        ActiveSupport::Notifications.instrument(
          "render_template.action_view",
          identifier: template.identifier,
          layout: layout&.virtual_path,
        ) { template.render(view, locals) { |*name| view._layout_for(*name) } }
      end
    view.controller.template = nil if template_controller
    rendered_template
  end
end

# frozen_string_literal: true

class DonutGraphComponent < ApplicationComponent
  include Math

  def initialize(displayed_value:, max_value:, primary_color:, secondary_color:, graph_title:, **kwargs)
    super(**kwargs)
    @graph_title = graph_title
    @displayed_value = displayed_value
    @max_value = max_value
    @primary_color = primary_color
    @secondary_color = secondary_color

    @PI = Math::PI
  end
end

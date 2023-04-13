# frozen_string_literal: true

class DonutGraphComponent < ApplicationComponent

  def initialize(displayed_value:, max_value:, primary_color:, secondary_color:, **kwargs)
    super(**kwargs)

    @displayed_value = displayed_value
    @max_value = max_value
    @primary_color = primary_color
    @secondary_color = secondary_color
  end
end

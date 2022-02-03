# typed: strict
# frozen_string_literal: true

Trestle.admin(:dashboard) do
  menu { item :dashboard, icon: "fa fa-tachometer" }

  # controller do
  #   def index
  #     @missing_warhead_count = Warhead.missing.count
  #   end
  # end
end

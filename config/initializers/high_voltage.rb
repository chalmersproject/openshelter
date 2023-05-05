# typed: true
# frozen_string_literal: true

HighVoltage.configure do |config|
  config.route_drawer = HighVoltage::RouteDrawers::Root
  config.home_page = "home"
end

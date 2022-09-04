# typed: true
# frozen_string_literal: true

class EnablePostgisExtension < ActiveRecord::Migration[7.0]
  def change
    enable_extension "postgis"
  end
end

# typed: true
# frozen_string_literal: true

class RefreshSitemapJob < ApplicationJob
  extend T::Sig

  queue_as :default

  sig { void }
  def perform
    Rails.application.load_tasks
    Rake::Task["sitemap:refresh"].invoke
  end
end

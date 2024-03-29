# typed: true
# frozen_string_literal: true

class CleanupStorageJob < ApplicationJob
  extend T::Sig

  queue_as :default

  sig { void }
  def perform
    ActiveStorage::Blob
      .unattached
      .where("active_storage_blobs.created_at <= ?", 2.days.ago)
      .find_each(&:purge_later)
  end
end

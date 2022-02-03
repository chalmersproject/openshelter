# typed: strict
# frozen_string_literal: true

GoodJob.active_record_parent_class = "ApplicationRecord"

Rails.application.configure { config.good_job.enable_cron = true }

# typed: strict
# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Chalmers Robot <robot@chalmersproject.com>",
          reply_to: "Chalmers Support <support@chalmersproject.com>"
  layout "mailer"
end

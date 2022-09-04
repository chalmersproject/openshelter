# rubocop:disable Rails/OutputSafety# typed: false
# frozen_string_literal: true

module SimpleForm
  module Components
    module Errors
      # Customize formatting of error text under form fields.
      def error_text
        text = has_custom_error? ? options[:error] : errors.send(error_method)
        text = text.humanize + "."
        "#{html_escape(options[:error_prefix])} #{html_escape(text)}".lstrip
          .html_safe
      end

      # def full_error_text
      #   text =
      #     has_custom_error? ? options[:error] : full_errors.send(error_method)
      #   "#{html_escape(text)}.".html_safe
      # end
    end
  end
end

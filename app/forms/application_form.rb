# typed: true
# frozen_string_literal: true

require "active_form"

class ApplicationForm
  extend Enumerize

  include ActiveForm::Base
  include ActiveForm::SimpleFormHelpers

  Parameters =
    T.type_alias do
      T.any(T::Hash[T.untyped, T.untyped], ActionController::Parameters)
    end
end

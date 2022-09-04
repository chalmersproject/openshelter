# typed: true
# frozen_string_literal: true

class Devise::FailureApp
  protected

  # Downcase first letter of the humanized attribute names when authentication
  # fails.
  def i18n_message(default = nil)
    message = warden_message || default || :unauthenticated

    if message.is_a?(Symbol)
      options = {}
      options[:resource_name] = scope
      options[:scope] = "devise.failure"
      options[:default] = [message]
      auth_keys = scope_class.authentication_keys
      keys =
        (auth_keys.respond_to?(:keys) ? auth_keys.keys : auth_keys)
          .map do |key|
          name = scope_class.human_attribute_name(key)
          name[0].downcase!
          name
        end
      options[:authentication_keys] =
        keys.join(I18n.t(:"support.array.words_connector"))
      options = i18n_options(options)

      I18n.t(:"#{scope}.#{message}", **options)
    else
      message.to_s
    end
  end
end

module Devise::Models
  module Invitable
    extend T::Helpers

    requires_ancestor { Kernel }

    # Run after_confirmation callback.
    def accept_invitation!
      if invited_to_sign_up?
        @accepting_invitation = true
        run_callbacks(:invitation_accepted) do
            T.bind(self, T.all(ApplicationRecord, Invitable))
            accept_invitation
            if is_a?(Confirmable)
              self[:confirmed_at] ||= self[:invitation_accepted_at]
              after_confirmation
            end
            save
          end
          .tap do |saved|
            rollback_accepted_invitation unless saved
            @accepting_invitation = false
          end
      end
    end
  end
end

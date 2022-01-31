# typed: false
# frozen_string_literal: true

json.user do
  if @user.present?
    json.partial! "users/user", user: @user
  else
    json.null!
  end
end

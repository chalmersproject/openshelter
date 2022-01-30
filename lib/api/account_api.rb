# typed: ignore
# frozen_string_literal: true

class AccountAPI < ApplicationAPI
  docs "Show currently authenticated user."
  get "/" do
    present({ user: current_user })
  end

  params do
    requires(:credentials, type: Hash) do
      requires(:email, :password)
      optional(:redirect_url)
    end
  end
  post "/login" do
    # Create and persist session.
    email, password = declared(params).values_at(:email, :password)
    session = UserSession.new(email: email, password: password)
    present({ errors: session.errors }) unless session.save

    # Redirect to :redirect_url, or /.
    redirect_url = params.fetch(:redirect_url, "/")
    redirect(redirect_url)
  end
end

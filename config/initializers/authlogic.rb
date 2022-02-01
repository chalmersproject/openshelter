# typed: strict
# frozen_string_literal: true

Authlogic::Session::Base.cookie_key = "credentials"
Authlogic::Session::Base.encrypt_cookie = true

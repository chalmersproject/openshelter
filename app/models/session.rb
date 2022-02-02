# typed: strict
# frozen_string_literal: true

class Session < Authlogic::Session::Base
  authenticate_with User
end

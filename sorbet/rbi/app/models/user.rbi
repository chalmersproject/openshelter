# typed: strong

class User < ApplicationRecord
  extend Devise::Models
  extend Devise::Models::Authenticatable
  extend Devise::Models::DatabaseAuthenticatable
  extend Devise::Models::Registerable
  extend Devise::Models::Rememberable
  extend Devise::Models::Validatable
  extend Devise::Models::Confirmable
  extend Devise::Models::Trackable

  include Devise::Models::Authenticatable
  include Devise::Models::DatabaseAuthenticatable
  include Devise::Models::Registerable
  include Devise::Models::Rememberable
  include Devise::Models::Validatable
  include Devise::Models::Confirmable
  include Devise::Models::Trackable

  sig { params(conditions: T.untyped).returns(T.self_type) }
  def self.find_for_database_authentication(**conditions); end

  sig do
    params(params: T::Hash[Symbol, T.untyped], session: T.untyped)
      .returns(T.self_type)
  end
  def self.new_with_session(params, session); end
end

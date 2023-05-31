# frozen_string_literal: true

class ApiKeyFormComponent < ApplicationComponent
  extend T::Sig

  sig { params(api_key: ApiKey, kwargs: T.untyped).void }
  def initialize(api_key:, **kwargs)
    super(**kwargs)
    @api_key = api_key
  end

  private

  sig { returns(ApiKey) }
  attr_reader :api_key

  delegate :new_record?, to: :api_key
end

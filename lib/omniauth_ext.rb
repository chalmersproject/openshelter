# typed: strict
# frozen_string_literal: true

# Modify Facebook strategy to handle a custom redirect_uri.
class OmniAuth::Strategies::Facebook
  extend T::Sig

  option :authorize_options, %i[scope display auth_type redirect_uri]

  sig { override.returns(T.untyped) }
  def authorize_params
    # rubocop:disable Performance/CollectionLiteralInLoop
    super.tap do |params|
      options[:authorize_options].each do |key|
        params[key] = request.params[key.to_s] unless [nil, ""].include?(
          request.params[key.to_s],
        )
      end
    end
    # rubocop:enable Performance/CollectionLiteralInLoop
  end

  sig { override.returns(T.untyped) }
  def token_params
    super.merge(request.params.slice("redirect_uri"))
  end
end

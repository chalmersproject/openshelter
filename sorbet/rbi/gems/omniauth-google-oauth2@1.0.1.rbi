# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `omniauth-google-oauth2` gem.
# Please instead update this file by running `bin/tapioca gem omniauth-google-oauth2`.

module OmniAuth
  class << self
    def config; end
    def configure; end
    def logger; end
    def mock_auth_for(provider); end
    def strategies; end
  end
end

module OmniAuth::Strategies; end

# Main class for Google OAuth2 strategy.
class OmniAuth::Strategies::GoogleOauth2 < ::OmniAuth::Strategies::OAuth2
  def authorize_params; end
  def build_access_token; end
  def custom_build_access_token; end
  def raw_info; end

  private

  def callback_url; end
  def client_get_token(verifier, redirect_uri); end
  def get_access_token(request); end
  def get_scope(params); end
  def get_token_options(redirect_uri = T.unsafe(nil)); end
  def get_token_params; end
  def image_params; end

  # @return [Boolean]
  def image_size_opts_passed?; end

  def image_url; end
  def prune!(hash); end
  def strip_unnecessary_query_parameters(query_parameters); end
  def token_info(access_token); end
  def verified_email; end

  # @raise [CallbackError]
  def verify_hd(access_token); end

  def verify_token(access_token); end
end

OmniAuth::Strategies::GoogleOauth2::ALLOWED_ISSUERS = T.let(T.unsafe(nil), Array)
OmniAuth::Strategies::GoogleOauth2::BASE_SCOPES = T.let(T.unsafe(nil), Array)
OmniAuth::Strategies::GoogleOauth2::BASE_SCOPE_URL = T.let(T.unsafe(nil), String)
OmniAuth::Strategies::GoogleOauth2::DEFAULT_SCOPE = T.let(T.unsafe(nil), String)
OmniAuth::Strategies::GoogleOauth2::IMAGE_SIZE_REGEXP = T.let(T.unsafe(nil), Regexp)
OmniAuth::Strategies::GoogleOauth2::USER_INFO_URL = T.let(T.unsafe(nil), String)

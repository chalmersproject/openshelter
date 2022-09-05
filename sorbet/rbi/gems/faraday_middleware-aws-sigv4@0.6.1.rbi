# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `faraday_middleware-aws-sigv4` gem.
# Please instead update this file by running `bin/tapioca gem faraday_middleware-aws-sigv4`.

# source://faraday_middleware-aws-sigv4//lib/faraday_middleware/aws_sigv4.rb#5
module FaradayMiddleware; end

# source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4.rb#7
class FaradayMiddleware::AwsSigV4 < ::Faraday::Middleware
  include ::FaradayMiddleware::AwsSigV4Util

  # @return [AwsSigV4] a new instance of AwsSigV4
  #
  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4.rb#10
  def initialize(app, options = T.unsafe(nil)); end

  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4.rb#16
  def call(env); end

  private

  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4.rb#32
  def build_aws_sigv4_request(env); end

  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4.rb#23
  def sign!(env); end
end

# source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4_util.rb#4
module FaradayMiddleware::AwsSigV4Util
  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4_util.rb#5
  def seahorse_encode_query(url); end

  # source://faraday_middleware-aws-sigv4//lib/faraday_middleware/request/aws_sigv4_util.rb#18
  def seahorse_encode_www_form(params); end
end
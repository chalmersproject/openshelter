# typed: false
# frozen_string_literal: true

module Loaf::ViewExtensions
  # Identify current action using controller template path.
  def current_crumb?(path, pattern = :inclusive)
    # Parse crumb path and current path.
    path = URI::DEFAULT_PARSER.unescape(path)
    path.force_encoding(Encoding::BINARY)

    action = File.basename(controller.template_path)
    current_path =
      begin
        url_for(controller: controller_name, action: action, only_path: true)
      rescue ActionController::UrlGenerationError
        request.path
      end
    current_path.force_encoding(Encoding::BINARY)

    # Strip away trailing slash.
    if path.start_with?("/") && path != "/"
      path.chomp!("/")
      current_path.chomp!("/")
    end

    if %r{^\w+://}.match?(path)
      path.chomp!("/")
      current_path.insert(0, "#{request.protocol}#{request.host_with_port}")
    end

    case pattern
    when :inclusive
      !current_path.match(%r{^#{Regexp.escape(path)}(\/.*|\?.*)?$}).nil?
    when :exclusive
      !current_path.match(%r{^#{Regexp.escape(path)}\/?(\?.*)?$}).nil?
    when :exact
      current_path == path
    when :force
      true
    when Regexp
      !current_path.match(pattern).nil?
    when Hash
      query_params = URI.encode_www_form(pattern)
      !current_path.match(
        %r{^#{Regexp.escape(path)}\/?(\?.*)?.*?#{query_params}.*$},
      ).nil?
    else
      raise ArgumentError, "unknown `:#{pattern}` match option!"
    end
  end
end

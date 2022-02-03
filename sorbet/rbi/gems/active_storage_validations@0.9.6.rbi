# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `active_storage_validations` gem.
# Please instead update this file by running `bin/tapioca gem active_storage_validations`.

# Big thank you to the paperclip validation matchers:
# https://github.com/thoughtbot/paperclip/blob/v6.1.0/lib/paperclip/matchers/validate_attachment_size_matcher.rb
module ActiveStorageValidations; end

# :nodoc
class ActiveStorageValidations::AspectRatioValidator < ::ActiveModel::EachValidator
  def initialize(options); end

  def check_validity!; end

  # Rails 5
  def validate_each(record, attribute, _value); end

  private

  def add_error(record, attribute, type, interpolate = T.unsafe(nil)); end
  def is_valid?(record, attribute, metadata); end
end

ActiveStorageValidations::AspectRatioValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)
ActiveStorageValidations::AspectRatioValidator::PRECISION = T.let(T.unsafe(nil), Integer)

class ActiveStorageValidations::AttachedValidator < ::ActiveModel::EachValidator
  def validate_each(record, attribute, _value); end
end

class ActiveStorageValidations::ContentTypeValidator < ::ActiveModel::EachValidator
  def content_type(file); end
  def is_valid?(file); end
  def types; end
  def types_to_human_format; end
  def validate_each(record, attribute, _value); end
end

# :nodoc
class ActiveStorageValidations::DimensionValidator < ::ActiveModel::EachValidator
  def initialize(options); end

  def add_error(record, attribute, type, **attrs); end
  def check_validity!; end
  def is_valid?(record, attribute, file_metadata); end

  # Rails 5
  def validate_each(record, attribute, _value); end
end

ActiveStorageValidations::DimensionValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)
class ActiveStorageValidations::Engine < ::Rails::Engine; end

class ActiveStorageValidations::LimitValidator < ::ActiveModel::EachValidator
  def check_validity!; end
  def files_count_valid?(count); end
  def validate_each(record, attribute, _); end
end

ActiveStorageValidations::LimitValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)

class ActiveStorageValidations::Metadata
  def initialize(file); end

  # Returns the value of attribute file.
  def file; end

  def metadata; end

  private

  def logger; end
  def read_file_path; end
  def read_image; end
  def rotated_image?(image); end
end

class ActiveStorageValidations::Railtie < ::Rails::Railtie; end

class ActiveStorageValidations::SizeValidator < ::ActiveModel::EachValidator
  def check_validity!; end
  def content_size_valid?(file_size); end
  def max_size; end
  def min_size; end
  def number_to_human_size(*_arg0, &_arg1); end
  def validate_each(record, attribute, _value); end
end

ActiveStorageValidations::SizeValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)
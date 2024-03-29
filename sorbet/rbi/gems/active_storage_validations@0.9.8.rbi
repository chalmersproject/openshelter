# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `active_storage_validations` gem.
# Please instead update this file by running `bin/tapioca gem active_storage_validations`.

class ActiveRecord::Base
  include ::ActiveModel::ForbiddenAttributesProtection
  include ::ActiveModel::AttributeAssignment
  include ::ActiveModel::Serialization
  include ::ActiveStorageValidations
  extend ::ActiveRecordExtended::RelationPatch::QueryDelegation
end

# Big thank you to the paperclip validation matchers:
# https://github.com/thoughtbot/paperclip/blob/v6.1.0/lib/paperclip/matchers/validate_attachment_size_matcher.rb
#
# source://active_storage_validations//lib/active_storage_validations/railtie.rb#3
module ActiveStorageValidations; end

# :nodoc
#
# source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#6
class ActiveStorageValidations::AspectRatioValidator < ::ActiveModel::EachValidator
  # @return [AspectRatioValidator] a new instance of AspectRatioValidator
  #
  # source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#10
  def initialize(options); end

  # @raise [ArgumentError]
  #
  # source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#15
  def check_validity!; end

  # Rails 5
  #
  # source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#21
  def validate_each(record, attribute, _value); end

  private

  # source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#92
  def add_error(record, attribute, type, interpolate = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#57
  def is_valid?(record, attribute, metadata); end
end

# source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#7
ActiveStorageValidations::AspectRatioValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)

# source://active_storage_validations//lib/active_storage_validations/aspect_ratio_validator.rb#8
ActiveStorageValidations::AspectRatioValidator::PRECISION = T.let(T.unsafe(nil), Integer)

# source://active_storage_validations//lib/active_storage_validations/attached_validator.rb#4
class ActiveStorageValidations::AttachedValidator < ::ActiveModel::EachValidator
  # source://active_storage_validations//lib/active_storage_validations/attached_validator.rb#5
  def validate_each(record, attribute, _value); end
end

# source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#4
class ActiveStorageValidations::ContentTypeValidator < ::ActiveModel::EachValidator
  # source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#40
  def content_type(file); end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#44
  def is_valid?(file); end

  # source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#22
  def types; end

  # source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#34
  def types_to_human_format; end

  # source://active_storage_validations//lib/active_storage_validations/content_type_validator.rb#5
  def validate_each(record, attribute, _value); end
end

# :nodoc
#
# source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#6
class ActiveStorageValidations::DimensionValidator < ::ActiveModel::EachValidator
  # @return [DimensionValidator] a new instance of DimensionValidator
  #
  # source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#9
  def initialize(options); end

  # source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#123
  def add_error(record, attribute, type, **attrs); end

  # @raise [ArgumentError]
  #
  # source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#29
  def check_validity!; end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#66
  def is_valid?(record, attribute, file_metadata); end

  # Rails 5
  #
  # source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#36
  def validate_each(record, attribute, _value); end
end

# source://active_storage_validations//lib/active_storage_validations/dimension_validator.rb#7
ActiveStorageValidations::DimensionValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)

# source://active_storage_validations//lib/active_storage_validations/engine.rb#4
class ActiveStorageValidations::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.0.3.1/lib/active_support/callbacks.rb#68
    def __callbacks; end
  end
end

# source://active_storage_validations//lib/active_storage_validations/limit_validator.rb#4
class ActiveStorageValidations::LimitValidator < ::ActiveModel::EachValidator
  # @raise [ArgumentError]
  #
  # source://active_storage_validations//lib/active_storage_validations/limit_validator.rb#7
  def check_validity!; end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/limit_validator.rb#23
  def files_count_valid?(count); end

  # source://active_storage_validations//lib/active_storage_validations/limit_validator.rb#13
  def validate_each(record, attribute, _); end
end

# source://active_storage_validations//lib/active_storage_validations/limit_validator.rb#5
ActiveStorageValidations::LimitValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)

# source://active_storage_validations//lib/active_storage_validations/metadata.rb#2
class ActiveStorageValidations::Metadata
  # @return [Metadata] a new instance of Metadata
  #
  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#5
  def initialize(file); end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#14
  def exception_class; end

  # Returns the value of attribute file.
  #
  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#3
  def file; end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#10
  def image_processor; end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#30
  def metadata; end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#22
  def require_image_processor; end

  private

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#123
  def logger; end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#112
  def read_file_path; end

  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#42
  def read_image; end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#101
  def rotated_image?(image); end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/metadata.rb#95
  def valid_image?(image); end
end

# source://active_storage_validations//lib/active_storage_validations/railtie.rb#4
class ActiveStorageValidations::Railtie < ::Rails::Railtie; end

# source://active_storage_validations//lib/active_storage_validations/size_validator.rb#4
class ActiveStorageValidations::SizeValidator < ::ActiveModel::EachValidator
  # @raise [ArgumentError]
  #
  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#9
  def check_validity!; end

  # @return [Boolean]
  #
  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#36
  def content_size_valid?(file_size); end

  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#54
  def max_size; end

  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#50
  def min_size; end

  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#5
  def number_to_human_size(*_arg0, **_arg1, &_arg2); end

  # source://active_storage_validations//lib/active_storage_validations/size_validator.rb#15
  def validate_each(record, attribute, _value); end
end

# source://active_storage_validations//lib/active_storage_validations/size_validator.rb#7
ActiveStorageValidations::SizeValidator::AVAILABLE_CHECKS = T.let(T.unsafe(nil), Array)

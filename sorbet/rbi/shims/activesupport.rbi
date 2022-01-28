# typed: strict

class ActiveSupport::StringInquirer
  sig { returns(T::Boolean) }
  def production?; end

  sig { returns(T::Boolean) }
  def development?; end

  sig { returns(T::Boolean) }
  def test?; end
end

module Kernel
  # class_eval on an object acts like singleton_class.class_eval.
  def class_eval(*args, &block); end

  # A shortcut to define a toplevel concern, not within a module.
  #
  # See Module::Concerning for more.
  def concern(topic, &module_definition); end

  # Sets $VERBOSE to +true+ for the duration of the block and back to its
  # original value afterwards.
  def enable_warnings(&block); end

  # Sets $VERBOSE to +nil+ for the duration of the block and back to its original
  # value afterwards.
  #
  # silence_warnings do
  # value = noisy_call # no warning voiced
  # end
  #
  # noisy_call # warning voiced
  def silence_warnings(&block); end

  # Blocks and ignores any exception passed as argument if raised within the block.
  #
  # suppress(ZeroDivisionError) do
  # 1/0
  # puts 'This code is NOT reached'
  # end
  #
  # puts 'This code gets executed and nothing related to ZeroDivisionError was seen'
  def suppress(*exception_classes, &block); end

  # Sets $VERBOSE for the duration of the block and back to its original
  # value afterwards.
  def with_warnings(flag); end

  class << self
    # A shortcut to define a toplevel concern, not within a module.
    #
    # See Module::Concerning for more.
    def concern(topic, &module_definition); end

    # Sets $VERBOSE to +true+ for the duration of the block and back to its
    # original value afterwards.
    def enable_warnings(&block); end

    # Sets $VERBOSE to +nil+ for the duration of the block and back to its original
    # value afterwards.
    #
    # silence_warnings do
    # value = noisy_call # no warning voiced
    # end
    #
    # noisy_call # warning voiced
    def silence_warnings(&block); end

    # Blocks and ignores any exception passed as argument if raised within the block.
    #
    # suppress(ZeroDivisionError) do
    # 1/0
    # puts 'This code is NOT reached'
    # end
    #
    # puts 'This code gets executed and nothing related to ZeroDivisionError was seen'
    def suppress(*exception_classes); end

    # Sets $VERBOSE for the duration of the block and back to its original
    # value afterwards.
    def with_warnings(flag); end
  end
end

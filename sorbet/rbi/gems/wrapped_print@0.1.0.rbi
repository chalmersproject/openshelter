# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `wrapped_print` gem.
# Please instead update this file by running `bin/tapioca gem wrapped_print`.

class Object < ::BasicObject
  include ::Kernel
  include ::DEBUGGER__::TrapInterceptor
  include ::WrappedPrint::Main
end

# end
#
# source://wrapped_print//lib/wrapped_print/version.rb#1
module WrappedPrint
  # source://wrapped_print//lib/wrapped_print.rb#17
  def level; end

  # source://wrapped_print//lib/wrapped_print.rb#17
  def level=(val); end

  # source://wrapped_print//lib/wrapped_print.rb#14
  def log_to; end

  # source://wrapped_print//lib/wrapped_print.rb#14
  def log_to=(val); end

  class << self
    # source://wrapped_print//lib/wrapped_print.rb#17
    def level; end

    # source://wrapped_print//lib/wrapped_print.rb#17
    def level=(val); end

    # source://wrapped_print//lib/wrapped_print.rb#14
    def log_to; end

    # source://wrapped_print//lib/wrapped_print.rb#14
    def log_to=(val); end

    # @yield [_self]
    # @yieldparam _self [WrappedPrint] the object that the method was called on
    #
    # source://wrapped_print//lib/wrapped_print.rb#20
    def setup; end
  end
end

# source://wrapped_print//lib/wrapped_print.rb#24
module WrappedPrint::Main
  # source://wrapped_print//lib/wrapped_print.rb#29
  def __wp__(label = T.unsafe(nil), pattern: T.unsafe(nil), count: T.unsafe(nil), prefix: T.unsafe(nil), suffix: T.unsafe(nil), color: T.unsafe(nil)); end

  # source://wrapped_print//lib/wrapped_print.rb#29
  def wp(label = T.unsafe(nil), pattern: T.unsafe(nil), count: T.unsafe(nil), prefix: T.unsafe(nil), suffix: T.unsafe(nil), color: T.unsafe(nil)); end

  private

  # source://wrapped_print//lib/wrapped_print.rb#71
  def blue(text); end

  # source://wrapped_print//lib/wrapped_print.rb#74
  def colorize(text, color_code); end

  # source://wrapped_print//lib/wrapped_print.rb#72
  def dark_blue(text); end

  # source://wrapped_print//lib/wrapped_print.rb#69
  def dark_green(text); end

  # source://wrapped_print//lib/wrapped_print.rb#61
  def detect_color_method(e); end

  # source://wrapped_print//lib/wrapped_print.rb#53
  def detect_logger_method; end

  # source://wrapped_print//lib/wrapped_print.rb#68
  def green(text); end

  # source://wrapped_print//lib/wrapped_print.rb#66
  def none(text); end

  # source://wrapped_print//lib/wrapped_print.rb#73
  def pur(text); end

  # source://wrapped_print//lib/wrapped_print.rb#67
  def red(text); end

  # source://wrapped_print//lib/wrapped_print.rb#70
  def yellow(text); end
end

# source://wrapped_print//lib/wrapped_print.rb#25
WrappedPrint::Main::COLORS = T.let(T.unsafe(nil), Array)

# source://wrapped_print//lib/wrapped_print.rb#27
WrappedPrint::Main::COUNT = T.let(T.unsafe(nil), Integer)

# source://wrapped_print//lib/wrapped_print.rb#26
WrappedPrint::Main::PATTERN = T.let(T.unsafe(nil), String)

# source://wrapped_print//lib/wrapped_print/version.rb#2
WrappedPrint::VERSION = T.let(T.unsafe(nil), String)

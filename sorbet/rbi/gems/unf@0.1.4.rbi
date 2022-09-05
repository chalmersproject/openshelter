# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `unf` gem.
# Please instead update this file by running `bin/tapioca gem unf`.

module UNF; end

# UTF-8 string normalizer class.  Implementations may vary depending
# on the platform.
class UNF::Normalizer
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  # @return [Normalizer] a new instance of Normalizer
  def initialize; end

  def normalize(_arg0, _arg1); end

  class << self
    # A shortcut for instance.normalize(string, form).
    def normalize(string, form); end
  end
end

UNF::VERSION = T.let(T.unsafe(nil), String)
# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `public_suffix` gem.
# Please instead update this file by running `bin/tapioca gem public_suffix`.

# PublicSuffix is a Ruby domain name parser based on the Public Suffix List.
#
# The [Public Suffix List](https://publicsuffix.org) is a cross-vendor initiative
# to provide an accurate list of domain name suffixes.
#
# The Public Suffix List is an initiative of the Mozilla Project,
# but is maintained as a community resource. It is available for use in any software,
# but was originally created to meet the needs of browser manufacturers.
module PublicSuffix
  class << self
    # private
    def decompose(name, rule); end

    # Attempt to parse the name and returns the domain, if valid.
    #
    # This method doesn't raise. Instead, it returns nil if the domain is not valid for whatever reason.
    def domain(name, **options); end

    # Pretend we know how to deal with user input.
    def normalize(name); end

    # Parses +name+ and returns the {PublicSuffix::Domain} instance.
    def parse(name, list: T.unsafe(nil), default_rule: T.unsafe(nil), ignore_private: T.unsafe(nil)); end

    # Checks whether +domain+ is assigned and allowed, without actually parsing it.
    #
    # This method doesn't care whether domain is a domain or subdomain.
    # The validation is performed using the default {PublicSuffix::List}.
    def valid?(name, list: T.unsafe(nil), default_rule: T.unsafe(nil), ignore_private: T.unsafe(nil)); end
  end
end

PublicSuffix::BANG = T.let(T.unsafe(nil), String)
PublicSuffix::DOT = T.let(T.unsafe(nil), String)

# Domain represents a domain name, composed by a TLD, SLD and TRD.
class PublicSuffix::Domain
  # Creates and returns a new {PublicSuffix::Domain} instance.
  def initialize(*args); end

  # Returns a domain-like representation of this object
  # if the object is a {#domain?}, <tt>nil</tt> otherwise.
  #
  # PublicSuffix::Domain.new("com").domain
  # # => nil
  #
  # PublicSuffix::Domain.new("com", "google").domain
  # # => "google.com"
  #
  # PublicSuffix::Domain.new("com", "google", "www").domain
  # # => "www.google.com"
  #
  # This method doesn't validate the input. It handles the domain
  # as a valid domain name and simply applies the necessary transformations.
  #
  # This method returns a FQD, not just the domain part.
  # To get the domain part, use <tt>#sld</tt> (aka second level domain).
  #
  # PublicSuffix::Domain.new("com", "google", "www").domain
  # # => "google.com"
  #
  # PublicSuffix::Domain.new("com", "google", "www").sld
  # # => "google"
  def domain; end

  # Checks whether <tt>self</tt> looks like a domain.
  #
  # This method doesn't actually validate the domain.
  # It only checks whether the instance contains
  # a value for the {#tld} and {#sld} attributes.
  def domain?; end

  # Returns the full domain name.
  def name; end

  # Returns the value of attribute sld.
  def sld; end

  # Returns a subdomain-like representation of this object
  # if the object is a {#subdomain?}, <tt>nil</tt> otherwise.
  #
  # PublicSuffix::Domain.new("com").subdomain
  # # => nil
  #
  # PublicSuffix::Domain.new("com", "google").subdomain
  # # => nil
  #
  # PublicSuffix::Domain.new("com", "google", "www").subdomain
  # # => "www.google.com"
  #
  # This method doesn't validate the input. It handles the domain
  # as a valid domain name and simply applies the necessary transformations.
  #
  # This method returns a FQD, not just the subdomain part.
  # To get the subdomain part, use <tt>#trd</tt> (aka third level domain).
  #
  # PublicSuffix::Domain.new("com", "google", "www").subdomain
  # # => "www.google.com"
  #
  # PublicSuffix::Domain.new("com", "google", "www").trd
  # # => "www"
  def subdomain; end

  # Checks whether <tt>self</tt> looks like a subdomain.
  #
  # This method doesn't actually validate the subdomain.
  # It only checks whether the instance contains
  # a value for the {#tld}, {#sld} and {#trd} attributes.
  # If you also want to validate the domain,
  # use {#valid_subdomain?} instead.
  def subdomain?; end

  # Returns the value of attribute tld.
  def tld; end

  # Returns an array containing the domain parts.
  def to_a; end

  # Returns a string representation of this object.
  def to_s; end

  # Returns the value of attribute trd.
  def trd; end

  class << self
    # Splits a string into the labels, that is the dot-separated parts.
    #
    # The input is not validated, but it is assumed to be a valid domain name.
    def name_to_labels(name); end
  end
end

# Raised when trying to parse an invalid name.
# A name is considered invalid when no rule is found in the definition list.
class PublicSuffix::DomainInvalid < ::PublicSuffix::Error; end

# Raised when trying to parse a name that matches a suffix.
class PublicSuffix::DomainNotAllowed < ::PublicSuffix::DomainInvalid; end

class PublicSuffix::Error < ::StandardError; end

# A {PublicSuffix::List} is a collection of one
# or more {PublicSuffix::Rule}.
#
# Given a {PublicSuffix::List},
# you can add or remove {PublicSuffix::Rule},
# iterate all items in the list or search for the first rule
# which matches a specific domain name.
#
# # Create a new list
# list =  PublicSuffix::List.new
#
# # Push two rules to the list
# list << PublicSuffix::Rule.factory("it")
# list << PublicSuffix::Rule.factory("com")
#
# # Get the size of the list
# list.size
# # => 2
#
# # Search for the rule matching given domain
# list.find("example.com")
# # => #<PublicSuffix::Rule::Normal>
# list.find("example.org")
# # => nil
#
# You can create as many {PublicSuffix::List} you want.
# The {PublicSuffix::List.default} rule list is used
# to tokenize and validate a domain.
class PublicSuffix::List
  # Initializes an empty {PublicSuffix::List}.
  def initialize; end

  # Adds the given object to the list and optionally refreshes the rule index.
  def <<(rule); end

  # Checks whether two lists are equal.
  #
  # List <tt>one</tt> is equal to <tt>two</tt>, if <tt>two</tt> is an instance of
  # {PublicSuffix::List} and each +PublicSuffix::Rule::*+
  # in list <tt>one</tt> is available in list <tt>two</tt>, in the same order.
  def ==(other); end

  # Adds the given object to the list and optionally refreshes the rule index.
  def add(rule); end

  # Removes all rules.
  def clear; end

  # Gets the default rule.
  def default_rule; end

  # Iterates each rule in the list.
  def each(&block); end

  # Checks whether the list is empty.
  def empty?; end

  # Checks whether two lists are equal.
  #
  # List <tt>one</tt> is equal to <tt>two</tt>, if <tt>two</tt> is an instance of
  # {PublicSuffix::List} and each +PublicSuffix::Rule::*+
  # in list <tt>one</tt> is available in list <tt>two</tt>, in the same order.
  def eql?(other); end

  # Finds and returns the rule corresponding to the longest public suffix for the hostname.
  def find(name, default: T.unsafe(nil), **options); end

  # Gets the number of rules in the list.
  def size; end

  protected

  # Returns the value of attribute rules.
  def rules; end

  private

  def entry_to_rule(entry, value); end
  def rule_to_entry(rule); end

  # Selects all the rules matching given hostame.
  #
  # If `ignore_private` is set to true, the algorithm will skip the rules that are flagged as
  # private domain. Note that the rules will still be part of the loop.
  # If you frequently need to access lists ignoring the private domains,
  # you should create a list that doesn't include these domains setting the
  # `private_domains: false` option when calling {.parse}.
  #
  # Note that this method is currently private, as you should not rely on it. Instead,
  # the public interface is {#find}. The current internal algorithm allows to return all
  # matching rules, but different data structures may not be able to do it, and instead would
  # return only the match. For this reason, you should rely on {#find}.
  def select(name, ignore_private: T.unsafe(nil)); end

  class << self
    # Gets the default rule list.
    #
    # Initializes a new {PublicSuffix::List} parsing the content
    # of {PublicSuffix::List.default_list_content}, if required.
    def default(**options); end

    # Sets the default rule list to +value+.
    def default=(value); end

    # Parse given +input+ treating the content as Public Suffix List.
    #
    # See http://publicsuffix.org/format/ for more details about input format.
    def parse(input, private_domains: T.unsafe(nil)); end
  end
end

PublicSuffix::List::DEFAULT_LIST_PATH = T.let(T.unsafe(nil), String)

# A Rule is a special object which holds a single definition
# of the Public Suffix List.
#
# There are 3 types of rules, each one represented by a specific
# subclass within the +PublicSuffix::Rule+ namespace.
#
# To create a new Rule, use the {PublicSuffix::Rule#factory} method.
#
# PublicSuffix::Rule.factory("ar")
# # => #<PublicSuffix::Rule::Normal>
module PublicSuffix::Rule
  class << self
    # The default rule to use if no rule match.
    #
    # The default rule is "*". From https://publicsuffix.org/list/:
    #
    # > If no rules match, the prevailing rule is "*".
    def default; end

    # Takes the +name+ of the rule, detects the specific rule class
    # and creates a new instance of that class.
    # The +name+ becomes the rule +value+.
    def factory(content, private: T.unsafe(nil)); end
  end
end

# = Abstract rule class
#
# This represent the base class for a Rule definition
# in the {Public Suffix List}[https://publicsuffix.org].
#
# This is intended to be an Abstract class
# and you shouldn't create a direct instance. The only purpose
# of this class is to expose a common interface
# for all the available subclasses.
#
# * {PublicSuffix::Rule::Normal}
# * {PublicSuffix::Rule::Exception}
# * {PublicSuffix::Rule::Wildcard}
#
# ## Properties
#
# A rule is composed by 4 properties:
#
# value   - A normalized version of the rule name.
# The normalization process depends on rule tpe.
#
# Here's an example
#
# PublicSuffix::Rule.factory("*.google.com")
# #<PublicSuffix::Rule::Wildcard:0x1015c14b0
# @value="google.com"
# >
#
# ## Rule Creation
#
# The best way to create a new rule is passing the rule name
# to the <tt>PublicSuffix::Rule.factory</tt> method.
#
# PublicSuffix::Rule.factory("com")
# # => PublicSuffix::Rule::Normal
#
# PublicSuffix::Rule.factory("*.com")
# # => PublicSuffix::Rule::Wildcard
#
# This method will detect the rule type and create an instance
# from the proper rule class.
#
# ## Rule Usage
#
# A rule describes the composition of a domain name and explains how to tokenize
# the name into tld, sld and trd.
#
# To use a rule, you first need to be sure the name you want to tokenize
# can be handled by the current rule.
# You can use the <tt>#match?</tt> method.
#
# rule = PublicSuffix::Rule.factory("com")
#
# rule.match?("google.com")
# # => true
#
# rule.match?("google.com")
# # => false
#
# Rule order is significant. A name can match more than one rule.
# See the {Public Suffix Documentation}[http://publicsuffix.org/format/]
# to learn more about rule priority.
#
# When you have the right rule, you can use it to tokenize the domain name.
#
# rule = PublicSuffix::Rule.factory("com")
#
# rule.decompose("google.com")
# # => ["google", "com"]
#
# rule.decompose("www.google.com")
# # => ["www.google", "com"]
class PublicSuffix::Rule::Base
  # Initializes a new rule.
  def initialize(value:, length: T.unsafe(nil), private: T.unsafe(nil)); end

  # Checks whether this rule is equal to <tt>other</tt>.
  def ==(other); end

  def decompose(*_arg0); end

  # Checks whether this rule is equal to <tt>other</tt>.
  def eql?(other); end

  def length; end

  # Checks if this rule matches +name+.
  #
  # A domain name is said to match a rule if and only if
  # all of the following conditions are met:
  #
  # - When the domain and rule are split into corresponding labels,
  # that the domain contains as many or more labels than the rule.
  # - Beginning with the right-most labels of both the domain and the rule,
  # and continuing for all labels in the rule, one finds that for every pair,
  # either they are identical, or that the label from the rule is "*".
  def match?(name); end

  def parts; end
  def private; end
  def value; end

  class << self
    # Initializes a new rule from the content.
    def build(content, private: T.unsafe(nil)); end
  end
end

class PublicSuffix::Rule::Entry < ::Struct
  # Returns the value of attribute length
  def length; end

  # Sets the attribute length
  def length=(_); end

  # Returns the value of attribute private
  def private; end

  # Sets the attribute private
  def private=(_); end

  # Returns the value of attribute type
  def type; end

  # Sets the attribute type
  def type=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# Exception represents an exception rule (e.g. !parliament.uk).
class PublicSuffix::Rule::Exception < ::PublicSuffix::Rule::Base
  # Decomposes the domain name according to rule properties.
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  # The leftmost label is not considered a label.
  #
  # See http://publicsuffix.org/format/:
  # If the prevailing rule is a exception rule,
  # modify it by removing the leftmost label.
  def parts; end

  # Gets the original rule definition.
  def rule; end

  class << self
    # Initializes a new rule from the content.
    def build(content, private: T.unsafe(nil)); end
  end
end

# Normal represents a standard rule (e.g. com).
class PublicSuffix::Rule::Normal < ::PublicSuffix::Rule::Base
  # Decomposes the domain name according to rule properties.
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  def parts; end

  # Gets the original rule definition.
  def rule; end
end

# Wildcard represents a wildcard rule (e.g. *.co.uk).
class PublicSuffix::Rule::Wildcard < ::PublicSuffix::Rule::Base
  # Initializes a new rule.
  def initialize(value:, length: T.unsafe(nil), private: T.unsafe(nil)); end

  # Decomposes the domain name according to rule properties.
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  def parts; end

  # Gets the original rule definition.
  def rule; end

  class << self
    # Initializes a new rule from the content.
    def build(content, private: T.unsafe(nil)); end
  end
end

PublicSuffix::STAR = T.let(T.unsafe(nil), String)

# The current library version.
PublicSuffix::VERSION = T.let(T.unsafe(nil), String)

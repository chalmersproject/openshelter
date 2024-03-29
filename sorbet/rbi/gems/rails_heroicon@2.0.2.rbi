# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails_heroicon` gem.
# Please instead update this file by running `bin/tapioca gem rails_heroicon`.

# source://rails_heroicon//lib/rails_heroicon/version.rb#1
module RailsHeroicon; end

# source://rails_heroicon//lib/rails_heroicon/helper.rb#4
module RailsHeroicon::Helper
  # To add a heroicon, call <tt><%= heroicon "icon_name" %></tt> on your erb template.
  # Head over to https://heroicons.com to view all the icons.
  #
  # == Options
  # The helper method accepts mutiple arguments such as:
  #
  # === Variant
  # There are two types of variants: 'outline' and 'solid', the default being the 'outline'.
  # To specify the solid variant, call <tt><%= heroicon "icon_name", variant: "solid" %></tt>
  #
  # === HTML attributes
  # Any <tt>html</tt> attribute is supported, for eg:
  #
  # <tt><%= heroicon "icon_name", class: "text-gray-500", data: { controller: "icon" } %></tt>
  #
  # === Handling the icon size
  # Normally, if you're just using vanilla heroicons with tailwindcss, you'd set <tt>w-5 h-5</tt> as class attributes
  # on the svg. With this helper, you just need to set the <tt>size</tt> attribute on the icon.
  #
  # <tt><%= heroicon "icon_name", size: 20 %></tt>
  #
  # This will set the <tt>height</tt> and <tt>width</tt> attribute on the svg.
  #
  # If the variant is set as <tt>outline</tt>, size automatically defaults to 24, and if the variant is set as
  # <tt>solid</tt>, size automatically defaults to 20. However, this can be over-written with the <tt>size</tt>
  # attribute.
  #
  # == Accessibility
  # The helper method automatically sets <tt>aria-hidden=true</tt> if <tt>aria-label</tt> is not set, and
  # if <tt>aria-label</tt> is set, then <tt>role=img</tt> is set automatically.
  #
  # source://rails_heroicon//lib/rails_heroicon/helper.rb#35
  def heroicon(symbol, title: T.unsafe(nil), **options); end
end

# source://rails_heroicon//lib/rails_heroicon.rb#8
RailsHeroicon::ICONS = T.let(T.unsafe(nil), Hash)

# source://rails_heroicon//lib/rails_heroicon.rb#7
RailsHeroicon::ICON_PATH = T.let(T.unsafe(nil), String)

# source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#4
class RailsHeroicon::RailsHeroicon
  # @raise [UndefinedVariant]
  # @return [RailsHeroicon] a new instance of RailsHeroicon
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#9
  def initialize(icon, variant: T.unsafe(nil), size: T.unsafe(nil), **options); end

  # Returns the value of attribute options.
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#7
  def options; end

  # Finds the svg icon with respect to variant.
  #
  # @raise [UndefinedIcon]
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#22
  def svg_path; end

  private

  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#31
  def a11y; end

  # If the user has explicitly stated the size attribute, then use that. If size attribute is not passed
  # then default to 24 if variant is outline or solid, else default to 20 if variant is mini.
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#59
  def icon_size_with(size); end

  # @return [Boolean]
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#74
  def mini?; end

  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#43
  def misc; end

  # @return [Boolean]
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#66
  def outline?; end

  # @return [Boolean]
  #
  # source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#70
  def solid?; end
end

# source://rails_heroicon//lib/rails_heroicon/rails_heroicon.rb#5
RailsHeroicon::RailsHeroicon::VARIANTS = T.let(T.unsafe(nil), Array)

# source://rails_heroicon//lib/rails_heroicon/railtie.rb#4
class RailsHeroicon::Railtie < ::Rails::Railtie; end

# source://rails_heroicon//lib/rails_heroicon/errors.rb#11
class RailsHeroicon::UndefinedIcon < ::StandardError
  # @return [UndefinedIcon] a new instance of UndefinedIcon
  #
  # source://rails_heroicon//lib/rails_heroicon/errors.rb#12
  def initialize(icon = T.unsafe(nil), exception_type = T.unsafe(nil)); end
end

# source://rails_heroicon//lib/rails_heroicon/errors.rb#2
class RailsHeroicon::UndefinedVariant < ::StandardError
  # @return [UndefinedVariant] a new instance of UndefinedVariant
  #
  # source://rails_heroicon//lib/rails_heroicon/errors.rb#3
  def initialize(msg = T.unsafe(nil), exception_type = T.unsafe(nil)); end
end

# source://rails_heroicon//lib/rails_heroicon/version.rb#2
RailsHeroicon::VERSION = T.let(T.unsafe(nil), String)

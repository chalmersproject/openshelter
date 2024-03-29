# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rgeo-activerecord` gem.
# Please instead update this file by running `bin/tapioca gem rgeo-activerecord`.

module Arel
  class << self
    def arel_node?(value); end
    def fetch_attribute(value, &block); end

    # Create a spatial constant node.
    # This node wraps a spatial value (such as an RGeo feature or a text
    # string in WKT format). It supports chaining with the functions
    # defined by RGeo::ActiveRecord::SpatialExpressions.
    def spatial(arg); end

    def sql(raw_sql); end
    def star; end
  end
end

Arel::Attribute = Arel::Attributes::Attribute
Arel::VERSION = T.let(T.unsafe(nil), String)

# -----------------------------------------------------------------------------
#
# Well-known text generator for RGeo
#
# -----------------------------------------------------------------------------
module RGeo; end

module RGeo::ActiveRecord
  class << self
    # Return a feature type module given a string type.
    def geometric_type_from_name(name); end

    # Returns true if spatial expressions (i.e. the methods in the
    # SpatialExpressions module) are supported.
    #
    # @return [Boolean]
    def spatial_expressions_supported?; end
  end
end

# This module is mixed into all geometry objects. It provides an
# as_json method so that ActiveRecord knows how to generate JSON
# for a geometry-valued field.
module RGeo::ActiveRecord::GeometryMixin
  # Serializes this object as JSON for ActiveRecord.
  def as_json(opts = T.unsafe(nil)); end

  class << self
    # Given a feature, returns an object that can be serialized as JSON
    # (i.e. usually a hash or string), using the current json_generator.
    # This is used to generate JSON for geometry-valued ActiveRecord
    # fields by default.
    def generate_json(geom); end

    # Set the style of JSON generation used for geometry fields in an
    # ActiveRecord model by default. You may pass nil to use
    # DEFAULT_JSON_GENERATOR, a proc that takes a geometry as the
    # argument and returns an object that can be converted to JSON
    # (i.e. usually a hash or string), or one of the following symbolic
    # values:
    #
    # <tt>:wkt</tt>::
    #   Well-known text format. (Same as DEFAULT_JSON_GENERATOR.)
    # <tt>:geojson</tt>::
    #   GeoJSON format. Requires the rgeo-geojson gem.
    def set_json_generator(value = T.unsafe(nil), &block); end
  end
end

# The default JSON generator Proc. Renders geometry fields as WKT.
RGeo::ActiveRecord::GeometryMixin::DEFAULT_JSON_GENERATOR = T.let(T.unsafe(nil), Proc)

# This node wraps an RGeo feature and gives it spatial expression constructors.
class RGeo::ActiveRecord::SpatialConstantNode
  include ::RGeo::ActiveRecord::SpatialExpressions

  # The delegate should be the RGeo feature.
  #
  # @return [SpatialConstantNode] a new instance of SpatialConstantNode
  def initialize(delegate); end

  # Return the RGeo feature
  def delegate; end
end

# A set of spatial expression builders.
# These methods can be chained off other spatial expressions to form
# complex expressions.
module RGeo::ActiveRecord::SpatialExpressions
  # --
  # Surface functions
  # ++
  def st_area(units = T.unsafe(nil)); end

  def st_asbinary; end
  def st_astext; end
  def st_boundary; end
  def st_buffer(distance, units = T.unsafe(nil)); end
  def st_centroid; end
  def st_contains(rhs); end
  def st_convexhull; end
  def st_crosses(rhs); end
  def st_difference(rhs); end

  # --
  # Geometry functions
  # ++
  def st_dimension; end

  def st_disjoint(rhs); end
  def st_distance(rhs, units = T.unsafe(nil)); end
  def st_endpoint; end
  def st_envelope; end
  def st_equals(rhs); end

  # --
  # Polygon functions
  # ++
  def st_exteriorring; end

  # --
  # Generic functions
  # ++
  def st_function(function, *args); end

  def st_geometryn(n); end
  def st_geometrytype; end
  def st_interiorringn(n); end
  def st_intersection(rhs); end
  def st_intersects(rhs); end
  def st_isclosed; end
  def st_isempty; end
  def st_isring; end
  def st_issimple; end
  def st_length(units = T.unsafe(nil)); end
  def st_m; end

  # --
  # GeometryCollection functions
  # ++
  def st_numgeometries; end

  def st_numinteriorrings; end

  # --
  # LineString functions
  # ++
  def st_numpoints; end

  def st_overlaps(rhs); end
  def st_pointn(n); end
  def st_pointonsurface; end
  def st_relate(rhs, matrix = T.unsafe(nil)); end
  def st_srid; end

  # --
  # Curve functions
  # ++
  def st_startpoint; end

  def st_symdifference(rhs); end
  def st_touches(rhs); end
  def st_union(rhs); end
  def st_within(rhs); end

  # --
  # Point functions
  # ++
  def st_x; end

  def st_y; end
  def st_z; end
end

class RGeo::ActiveRecord::SpatialFactoryStore
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  # @return [SpatialFactoryStore] a new instance of SpatialFactoryStore
  def initialize; end

  def clear; end
  def default(attrs = T.unsafe(nil)); end
  def default=(factory); end
  def factory(attrs); end
  def register(factory, attrs = T.unsafe(nil)); end

  # Returns the value of attribute registry.
  def registry; end

  # Sets the attribute registry
  #
  # @param value the value to set the attribute registry to.
  def registry=(_arg0); end

  private

  # Match attrs to the closest equal to or less specific factory
  #
  # That means that attrs can at most be matched to an Entry with the same
  # number of keys as it. But could match with a factory with only 1 key
  # in its attrs.
  #
  # Examples:
  #   attrs = {sql_type: "geometry" }, entry_attrs = {sql_type: "geometry", geo_type: "point"}
  #   is not a match because the entry is more specific than attrs
  #
  #   attrs = {sql_type: "geometry", geo_type: "point"}, entry_attrs = {sql_type: "geometry"}
  #   is a match because the entry is less specific than attrs and would be the fallback for all "geometry" types
  #
  #   attrs = {sql_type: "geometry", geo_type: "point"}, entry_attrs = {sql_type: "geometry", geo_type: "linestring"}
  #   is not a match because there are mismatched keys
  #
  # If there is no match, nil is returned
  def closest_factory(attrs); end

  # Returns number of common key/values
  # or -1 if oth is bigger than attrs, or they have a mismatched key/value pair
  def cmp_attrs(attrs, oth); end

  def default_for_attrs(attrs); end
  def filter_attrs(attrs); end
  def to_factory_attrs(attrs); end
end

class RGeo::ActiveRecord::SpatialFactoryStore::Entry < ::Struct
  # Returns the value of attribute attrs
  #
  # @return [Object] the current value of attrs
  def attrs; end

  # Sets the attribute attrs
  #
  # @param value [Object] the value to set the attribute attrs to.
  # @return [Object] the newly set value
  def attrs=(_); end

  # Returns the value of attribute factory
  #
  # @return [Object] the current value of factory
  def factory; end

  # Sets the attribute factory
  #
  # @param value [Object] the value to set the attribute factory to.
  # @return [Object] the newly set value
  def factory=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# A NamedFunction subclass that keeps track of the spatial-ness of
# the arguments and return values, so that it can provide context to
# visitors that want to interpret syntax differently when dealing with
# spatial elements.
class RGeo::ActiveRecord::SpatialNamedFunction < ::Arel::Nodes::NamedFunction
  include ::RGeo::ActiveRecord::SpatialExpressions

  # @return [SpatialNamedFunction] a new instance of SpatialNamedFunction
  def initialize(name, expr, spatial_flags = T.unsafe(nil), aliaz = T.unsafe(nil)); end

  # @return [Boolean]
  def spatial_argument?(index); end

  # @return [Boolean]
  def spatial_result?; end
end

# A set of common Arel visitor hacks for spatial ToSql visitors.
# Generally, a spatial ActiveRecord adapter should provide a custom
# ToSql Arel visitor that includes and customizes this module.
# See the existing spatial adapters (i.e. postgis, spatialite,
# mysqlspatial, and mysql2spatial) for usage examples.
module RGeo::ActiveRecord::SpatialToSql
  include ::RGeo::ActiveRecord::SpatialToPostGISSql

  # Map a standard OGC SQL function name to the actual name used by
  # a particular database. This method should take a name and
  # return either the changed name or the original name.
  def st_func(standard_name); end

  # Visit the SpatialNamedFunction node. This operates similarly to
  # the standard NamedFunction node, but it performs function name
  # mapping for the database, and it also uses the type information
  # in the node to determine when to cast string arguments to WKT,
  def visit_RGeo_ActiveRecord_SpatialNamedFunction(node, collector); end

  # Generates SQL for a spatial node.
  # The node must be a string (in which case it is treated as WKT),
  # an RGeo feature, or a spatial attribute.
  def visit_in_spatial_context(node, collector); end
end

RGeo::ActiveRecord::VERSION = T.let(T.unsafe(nil), String)
RGeo::VERSION = T.let(T.unsafe(nil), String)

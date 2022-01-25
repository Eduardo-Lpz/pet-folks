# RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
#   # By default, use the GEOS implementation for spatial columns.
#   config.default = RGeo::Geos.factory_generator

#   # But use a geographic implementation for point columns.
#   config.register(RGeo::Geographic.spherical_factory(srid: 4326), geo_type: "point")
# end

# RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |store|
#   store.default = RGeo::Cartesian.preferred_factory

#   store.register(RGeo::Geographic.spherical_factory(srid: 4326), {geo_type: "point", srid: 4326, sql_type: "geography"})
# end

# (-117.00371,32.5027)

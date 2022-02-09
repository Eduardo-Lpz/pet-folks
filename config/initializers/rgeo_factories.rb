RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
  # Use a geographic implementation for point columns.
  config.register(RGeo::Geographic.spherical_factory(srid: 4326), geo_type: "point")
end

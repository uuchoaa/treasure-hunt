Rails.configuration.treasure = {
  coordinates: {
    latitude: ENV['TREASURE_LATITUDE']&.to_f || 40.416775,
    longitude: ENV['TREASURE_LONGITUDE']&.to_f || -3.703790,
  },
  radius: ENV['TREASURE_RADIUS']&.to_i || 1000, # meters
}



# The Hotel Globo, located at -7.112778, -34.888889 in João Pessoa, Paraíba, Brazil, boasts a rich history:

# Past:

# Constructed in 1929, it served as a prominent hotel for decades.
# Known for its elegant architecture and central location, it was a popular spot for both local high society and visitors.
# Witnessed significant historical events during its time as a hotel.
# Present:

# No longer operates as a hotel, having transitioned to a cultural center.
# Offers various cultural activities, including art exhibitions, book launches, and presentations.
# Maintains its historical significance and architectural charm, serving as a reminder of João Pessoa's past.
# In essence:

# Hotel Globo transformed from a thriving hotel to a cultural hub, yet it continues to be a significant landmark in João Pessoa's history and cultural scene.

# It's close to the Praça Dom Ulrico, where the city was founded in 1585.

Rails.configuration.treasure = {
  coordinates: {
    latitude: ENV['TREASURE_LATITUDE']&.to_f || -7.112778,
    longitude: ENV['TREASURE_LONGITUDE']&.to_f || -34.888889,
  },
  radius: ENV['TREASURE_RADIUS']&.to_i || 1000, # meters
}



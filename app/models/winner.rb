class Winner < ApplicationRecord
  TREASURE_LATITUDE = 40.416775
  TREASURE_LONGITUDE = -3.703790

  belongs_to :user

  before_save :calculate_distance

  def calculate_distance
    treasure_coords = [TREASURE_LATITUDE, TREASURE_LONGITUDE]
    user_coords = [latitude, longitude]
    self.distance_to_treasure = Geocoder::Calculations.distance_between(user_coords, treasure_coords) * 1000 # meters
  end
  
end

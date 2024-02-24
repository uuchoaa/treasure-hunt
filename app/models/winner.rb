class Winner < ApplicationRecord
  TREASURE_LATITUDE = 40.416775
  TREASURE_LONGITUDE = -3.703790
  TREASURE_RADIUS = 1000 # meters

  belongs_to :user

  before_save :calculate_distance

  def calculate_distance
    treasure_coords = [TREASURE_LATITUDE, TREASURE_LONGITUDE]
    user_coords = [latitude, longitude]

    distance_to_treasure = Geocoder::Calculations.distance_between(user_coords, treasure_coords) * 1000 # meters

    if distance_to_treasure < TREASURE_RADIUS
      self.distance_to_treasure = distance_to_treasure
    else
      errors.add(:distance_to_treasure, "is too far away from the treasure")
      throw(:abort)
    end
  end

end

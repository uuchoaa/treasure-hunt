class Winner < ApplicationRecord
  belongs_to :user

  before_save :calculate_distance
  after_create :send_email_to_winner

  validates :latitude, :longitude, presence: true, numericality: true
  validates :user_id, uniqueness: true

  private

  def calculate_distance
    treasure_coords = Rails.configuration.treasure[:coordinates].values
    user_coords = [latitude, longitude]

    distance_to_treasure = Geocoder::Calculations.distance_between(user_coords, treasure_coords) * 1000 # meters

    if distance_to_treasure < Rails.configuration.treasure[:radius]
      self.distance_to_treasure = distance_to_treasure
    else
      errors.add(:distance_to_treasure, "is too far away from the treasure")
      throw(:abort)
    end
  end

  def send_email_to_winner
    WinnerMailer.with(winner: self).congratulate.deliver_now
  end
end

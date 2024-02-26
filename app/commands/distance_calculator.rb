class DistanceCalculator
  prepend SimpleCommand

  def initialize(guess_coordinates:)
    @guess_coordinates = guess_coordinates
    @treasure_coordinates = Rails.configuration.treasure[:coordinates].values
  end

  def call
    Geocoder::Calculations.distance_between(@guess_coordinates, @treasure_coordinates) * 1000 # meters
  end
end

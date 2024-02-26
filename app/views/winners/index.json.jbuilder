json.array! @winners do |winner|
  json.extract! winner, :id, :latitude, :longitude, :distance_to_treasure
  json.email winner.user.email
end

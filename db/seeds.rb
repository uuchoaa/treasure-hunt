Winner.create!(user: FactoryBot.create(:user), latitude: -7.112778, longitude: -34.888889) # Treasure Location!
Winner.create!(user: FactoryBot.create(:user), latitude: -7.117782, longitude: -34.888389)
Winner.create!(user: FactoryBot.create(:user), latitude: -7.118782, longitude: -34.888389)
Winner.create!(user: FactoryBot.create(:user), latitude: -7.118782, longitude: -34.888389)
Winner.create!(user: FactoryBot.create(:user), latitude: -7.119782, longitude: -34.888389)

puts "Done!"
puts "Run the following command to see the winners:"
puts "curl -X GET \"http://localhost:3000/winners?per_page=2\" -H \"accept: application/json\""
# curl -X GET "http://localhost:3000/winners?per_page=2" -H "accept: application/json"

json.winners do
  json.array! @winners do |winner|
    json.extract! winner, :id, :latitude, :longitude, :distance_to_treasure
    json.email winner.user.email
  end
end

json.current_page @winners.current_page
json.next_page @winners.next_page
json.prev_page @winners.previous_page
json.total_pages @winners.total_pages
json.total_entries @winners.total_entries

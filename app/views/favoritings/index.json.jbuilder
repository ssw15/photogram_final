json.array!(@favoritings) do |favoriting|
  json.extract! favoriting, :id, :photo_id, :favorited_by_id
  json.url favoriting_url(favoriting, format: :json)
end

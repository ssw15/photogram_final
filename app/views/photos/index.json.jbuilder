json.array!(@photos) do |photo|
  json.extract! photo, :id, :caption, :owner_id_id
  json.url photo_url(photo, format: :json)
end

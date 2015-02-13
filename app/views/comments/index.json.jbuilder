json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :photo_id, :commenter_id
  json.url comment_url(comment, format: :json)
end

json.array!(@followings) do |following|
  json.extract! following, :id, :follower_id, :leader_id
  json.url following_url(following, format: :json)
end

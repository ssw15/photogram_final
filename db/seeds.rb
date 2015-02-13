("a".."z").each do |letter|
  user = User.new

  user.email = "#{letter}@example.com"
  user.password = "12341234"
  user.password_confirmation = "12341234"

  user.save
end

puts "There are now #{User.count} users in the database."

User.all.each do |user|
  5.times do
    following = Following.new
    following.leader = user
    following.follower = User.offset(rand(User.count)).first
    following.save
  end
end

puts "There are now #{Following.count} followings in the database."

photo_info = [
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg",
    :caption => "Lake Bondhus"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Lanzarote_5_Luc_Viatour.jpg/1280px-Lanzarote_5_Luc_Viatour.jpg",
    :caption => "Cueva de los Verdes"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Fire_breathing_2_Luc_Viatour.jpg/1280px-Fire_breathing_2_Luc_Viatour.jpg",
    :caption => "Jaipur"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Ніжний_ранковий_світло.jpg/1280px-Ніжний_ранковий_світло.jpg",
    :caption => "Sviati Hory"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mostar_Old_Town_Panorama_2007.jpg/1280px-Mostar_Old_Town_Panorama_2007.jpg",
    :caption => "Mostar"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg/1280px-Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg",
    :caption => "Elakala"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Biandintz_eta_zaldiak_-_modified2.jpg/1280px-Biandintz_eta_zaldiak_-_modified2.jpg",
    :caption => "Biandintz"
  }
]

User.all.each do |user|
  photo_info.each do |photo_hash|
    filename = photo_hash[:source].split('/').last

    photo = Photo.new

    photo.image = File.open(Rails.root.join('lib', 'assets', filename).to_s)

    photo.caption = photo_hash[:caption]

    # random_user = User.offset(rand(User.count)).first

    photo.owner = user

    photo.save

    comment_messages = ["Very pretty", "My favorite one", "Kinda meh"]

    3.times do
      comment = photo.comments.build

      comment.content = comment_messages.sample
      comment.commenter = User.offset(rand(User.count)).first

      comment.save
    end

    3.times do
      favoriting = photo.favoritings.build

      favoriting.favorited_by = User.offset(rand(User.count)).first

      favoriting.save
    end
  end
end

puts "There are now #{Photo.count} photos in the database."
puts "There are now #{Comment.count} comments in the database."
puts "There are now #{Favoriting.count} favoritings in the database."

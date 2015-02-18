class Favoriting < ActiveRecord::Base
  belongs_to :photo, :counter_cache => true
  belongs_to :favorited_by, :class_name => "User"

  validates :photo, :presence => true

  validates :favorited_by, :presence => true, :uniqueness => { :scope => :photo }

  # after_create :increase_photo_favoritings_count
  # after_destroy :decrease_photo_favoritings_count

  # def increase_photo_favoritings_count
  #   p = self.photo
  #   p.favoritings_count += 1
  #   p.save
  # end

  # def decrease_photo_favoritings_count
  #   p = self.photo
  #   p.favoritings_count -= 1
  #   p.save
  # end


end

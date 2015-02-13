class Photo < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"

  mount_uploader :image, ImageUploader

  has_many :comments

  has_many :favoritings
end

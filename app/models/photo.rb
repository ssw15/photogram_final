class Photo < ActiveRecord::Base
  default_scope { order("created_at DESC") }

  belongs_to :owner, :class_name => "User"

  mount_uploader :image, ImageUploader

  has_many :comments

  has_many :favoritings

  validates :owner, :presence => true

  validates :image, :presence => true
end

class Favoriting < ActiveRecord::Base
  belongs_to :photo
  belongs_to :favorited_by, :class_name => "User"

  validates :photo, :presence => true

  validates :favorited_by, :presence => true, :uniqueness => { :scope => :photo }
end

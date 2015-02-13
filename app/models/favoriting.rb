class Favoriting < ActiveRecord::Base
  belongs_to :photo
  belongs_to :favorited_by, :class_name => "User"
end

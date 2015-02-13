class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :commenter, :class_name => "User"

  validates :photo, :presence => true

  validates :commenter, :presence => true

  validates :content, :presence => true
end

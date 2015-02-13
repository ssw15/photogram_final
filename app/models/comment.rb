class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :commenter, :class_name => "User"
end

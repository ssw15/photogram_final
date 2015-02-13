class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :owned_photos, :class_name => "Photos", :foreign_key => "owner_id"

  has_many :comments, :foreign_key => "commenter_id"

  has_many :favoritings, :foreign_key => "favorited_by_id"

  has_many :followings_where_follower, :class_name => "Following", :foreign_key => "follower_id"

  has_many :followings_where_leader, :class_name => "Following", :foreign_key => "leader_id"
end

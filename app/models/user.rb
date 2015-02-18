class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :owned_photos, :class_name => "Photo", :foreign_key => "owner_id"

  has_many :comments, :foreign_key => "commenter_id"

  has_many :favoritings, :foreign_key => "favorited_by_id"
  has_many :favorite_photos, :through => :favoritings, :source => :photo

  has_many :followings_where_follower, :class_name => "Following", :foreign_key => "follower_id"
  has_many :leaders, :through => :followings_where_follower, :source => :leader

  has_many :followings_where_leader, :class_name => "Following", :foreign_key => "leader_id"
  has_many :followers, :through => :followings_where_leader, :source => :follower

  has_many :timeline, :through => :leaders, :source => :owned_photos

  # current_user.favorite_photos
  # current_user.timeline

  # has_many :method_name, :through => :previous_association_to_walk_through, :source => :method_on_associated_object_that_fetches_what_you_want

  def admin?
    return self.email == "a@example.com"
  end


end

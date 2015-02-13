class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :leader, index: true

      t.timestamps null: false
    end
    add_foreign_key :followings, :followers
    add_foreign_key :followings, :leaders
  end
end

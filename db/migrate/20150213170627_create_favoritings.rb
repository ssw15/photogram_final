class CreateFavoritings < ActiveRecord::Migration
  def change
    create_table :favoritings do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :favorited_by, index: true

      t.timestamps null: false
    end
    add_foreign_key :favoritings, :photos
    add_foreign_key :favoritings, :users, :column => "favorited_by_id"
  end
end

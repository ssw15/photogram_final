class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :photo, index: true
      t.belongs_to :commenter, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :photos
    add_foreign_key :comments, :users, :column => "commenter_id"
  end
end

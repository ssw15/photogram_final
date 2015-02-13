class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :owners
  end
end

class AddFavoritingsCountToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :favoritings_count, :integer, :default => 0
  end
end

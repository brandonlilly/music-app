class AddLiveBoolToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :live, :boolean, null: false, default: false
  end
end

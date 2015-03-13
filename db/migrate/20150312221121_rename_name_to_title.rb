class RenameNameToTitle < ActiveRecord::Migration
  def change
    rename_column :albums, :name, :title
    rename_column :tracks, :name, :title
  end
end

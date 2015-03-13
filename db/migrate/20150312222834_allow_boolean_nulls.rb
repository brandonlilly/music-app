class AllowBooleanNulls < ActiveRecord::Migration
  def change
    change_column :albums, :live, :boolean, default: false
    change_column :tracks, :bonus, :boolean, default: false
  end
end

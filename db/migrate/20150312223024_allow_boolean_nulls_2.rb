class AllowBooleanNulls2 < ActiveRecord::Migration
  def change
    change_column :albums, :live, :boolean, null: true, default: false
    change_column :tracks, :bonus, :boolean, null: true, default: false
  end
end

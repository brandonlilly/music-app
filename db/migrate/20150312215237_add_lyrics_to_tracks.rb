class AddLyricsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :bonus, :boolean, null: false, default: false
    add_column :tracks, :lyrics, :text
  end
end

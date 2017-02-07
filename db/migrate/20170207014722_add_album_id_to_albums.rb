class AddAlbumIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :album_id, :integer
  end
end

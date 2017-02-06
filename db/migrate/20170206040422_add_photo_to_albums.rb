class AddPhotoToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :photo, :string
  end
end

class AddLevelToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :level, :integer
  end
end

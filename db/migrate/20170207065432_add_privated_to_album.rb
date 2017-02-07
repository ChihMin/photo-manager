class AddPrivatedToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :privated, :boolean
  end
end

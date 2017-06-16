class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title, limit: 255, null: false, index: true
      t.integer :artist_id, limit: 4, null: false, index: true
      t.timestamps
    end
  end
end

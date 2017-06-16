class CreateCovers < ActiveRecord::Migration[5.0]
  def change
    create_table :covers do |t|
      t.integer :album_id, limit: 4, null: false, index: true
      t.string :image_url, limit: 765, null: false, index: true

      t.timestamps
    end
  end
end

class CreateCovers < ActiveRecord::Migration[5.0]
  def change
    create_table :covers do |t|
      t.integer :album_id
      t.string :image_url

      t.timestamps
    end
  end
end

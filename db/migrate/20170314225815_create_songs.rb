class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false, index: true
      t.integer :style, null: false, index: true, limit: 1 # This is going to be enum
      t.integer :artist, null: false, index: true, limit: 4
      t.integer :album, null: false, index: true, limit: 4
      t.timestamps
    end
  end
end

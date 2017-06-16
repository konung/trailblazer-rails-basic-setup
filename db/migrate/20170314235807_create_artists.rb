class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :full_name,  null: false, index: true
      t.string :country, null: false, index: true, default: 'US' , limit: 2
      t.integer :sales_cents,  null: false, index: true , default: 0
      t.boolean :signed_with_label, index: true, default: false
      t.integer :billboard_position, size: 2, index: true
      t.text :bio
      t.timestamps
    end
  end
end

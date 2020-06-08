class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.boolean :is_soldout, default:false
      t.string :image_id
      t.text :introduction

      t.timestamps
    end
  end
end

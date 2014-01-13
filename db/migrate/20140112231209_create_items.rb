class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :price
      t.string :imageurl
      t.string :category
      t.text :paypalcode

      t.timestamps
    end
  end
end

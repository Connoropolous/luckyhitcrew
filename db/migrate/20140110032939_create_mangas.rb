class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :name
      t.string :slug
      t.text :synopsis

      t.timestamps
    end
  end
end

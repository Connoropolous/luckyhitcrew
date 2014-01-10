class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :image
      t.references :chapter

      t.timestamps
    end
    add_index :pages, :chapter_id
  end
end

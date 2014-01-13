class CreatePagetexts < ActiveRecord::Migration
  def change
    create_table :pagetexts do |t|
      t.text :text

      t.timestamps
    end
  end
end

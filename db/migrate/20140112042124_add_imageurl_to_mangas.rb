class AddImageurlToMangas < ActiveRecord::Migration
  def change
    add_column :mangas, :imageurl, :string
  end
end

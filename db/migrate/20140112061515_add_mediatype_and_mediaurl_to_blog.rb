class AddMediatypeAndMediaurlToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :mediatype, :string
    add_column :blogs, :mediaurl, :string
  end
end

class AddLinkToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :link, :string
  end
end

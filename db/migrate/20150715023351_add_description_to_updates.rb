class AddDescriptionToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :description, :text
  end
end

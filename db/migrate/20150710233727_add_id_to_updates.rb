class AddIdToUpdates < ActiveRecord::Migration
  def change
    add_index :updates, :id, unique: true
  end
end

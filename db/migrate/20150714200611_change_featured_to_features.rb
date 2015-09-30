class ChangeFeaturedToFeatures < ActiveRecord::Migration
  def change
    rename_table :featured, :features
    add_index :features, :id, unique: true
  end
end

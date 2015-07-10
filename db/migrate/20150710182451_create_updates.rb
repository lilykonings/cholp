class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.datetime :created_at
      t.string   :title
      t.string   :link
    end
  end
end

class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :sub_by
      t.integer :sub_to

      t.timestamps
    end
  end
end

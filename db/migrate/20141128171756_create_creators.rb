class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|

      t.timestamps

      t.boolean :active

      t.string :name
      t.string :banner
      t.string :icon

      t.text :description

      t.integer :num_prints
      t.integer :number_prints
      t.integer :num_subscribers

    end
  end
end

class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|

      t.timestamps

      t.string :name
      t.text :description

      t.string :path

      t.string :picture_zero
      t.string :picture_one
      t.string :picture_two
      t.string :picture_three
      t.string :picture_four
      t.string :picture_five

      t.integer :num_prints
      t.float :price

    end
  end
end

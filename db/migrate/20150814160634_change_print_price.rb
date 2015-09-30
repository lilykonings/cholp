class ChangePrintPrice < ActiveRecord::Migration
  def change
    remove_column :prints, :price, :text
    add_column :prints, :price, :decimal, precision: 5, scale: 2
  end
end

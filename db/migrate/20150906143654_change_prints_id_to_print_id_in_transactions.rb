class ChangePrintsIdToPrintIdInTransactions < ActiveRecord::Migration
  def change
  	remove_column :transactions, :prints_id, :integer
  	add_column :transactions, :print_id, :integer
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.timestamps
    	t.datetime	:purchased_at

    	t.references :prints, index: true
    	t.integer	:buyer_id
    	t.integer	:seller_id

    	t.string	:transaction_id
    	t.string	:status
    	t.text		:notification_params
    end

    add_index :transactions, :id, unique: true
  end
end

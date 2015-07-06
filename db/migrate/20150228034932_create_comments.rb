class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

	    t.timestamps

		t.integer :user_id

		t.datetime :time
		t.string :comment

		t.datetime :created_at

		t.datetime :updated_at
		t.integer :print_id
    end
  end
end

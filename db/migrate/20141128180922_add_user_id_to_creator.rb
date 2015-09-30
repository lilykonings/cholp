class AddUserIdToCreator < ActiveRecord::Migration
  def change
    add_column :creators, :user_id, :integer
  end
end

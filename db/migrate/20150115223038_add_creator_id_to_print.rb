class AddCreatorIdToPrint < ActiveRecord::Migration
  def change
    add_column :prints, :creator_id, :integer
  end
end

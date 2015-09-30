class AddTopCreatorToCreators < ActiveRecord::Migration
  def change
    add_column :creators, :top_creator, :boolean
  end
end

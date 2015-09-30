class AddFeaturedToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :featured, :boolean
  end
end

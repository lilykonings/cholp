class AddFeaturedToCreatorAndSiteFeaturedToPrints < ActiveRecord::Migration
  def change
    add_column :creators, :featured, :boolean
    add_column :prints, :site_featured, :boolean
  end
end

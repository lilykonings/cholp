class RemoveSiteFeaturedFromPrintsAndCreateHomeFeatured < ActiveRecord::Migration
  def change
    remove_column :prints, :site_featured

    create_table :featured do |t|
      t.datetime :created_at
      t.string   :tab_title
      t.string   :title
      t.text     :description
      t.string   :image
      t.string   :link
    end
  end
end

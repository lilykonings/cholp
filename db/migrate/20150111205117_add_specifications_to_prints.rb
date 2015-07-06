class AddSpecificationsToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :min_x, :float
    add_column :prints, :min_y, :float
    add_column :prints, :min_z, :float
    add_column :prints, :materials, :string
    add_column :prints, :color_supported, :boolean
    add_column :prints, :recommended_printers, :string
    add_column :prints, :resolution, :float
    add_column :prints, :tolerance, :float
  end
end

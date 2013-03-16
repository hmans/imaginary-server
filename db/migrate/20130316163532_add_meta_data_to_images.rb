class AddMetaDataToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_width, :integer
    add_column :images, :image_height, :integer
    add_column :images, :image_size, :integer
    add_column :images, :image_format, :string
  end
end

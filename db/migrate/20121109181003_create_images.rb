class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :bucket
      t.string :name
      t.string :image_uid

      t.timestamps
    end
    add_index :images, :bucket_id
  end
end

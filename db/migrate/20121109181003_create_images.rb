class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :bucket
      t.string :name

      t.timestamps
    end
    add_index :images, :bucket_id
  end
end

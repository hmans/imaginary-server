class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name
      t.string :secret

      t.timestamps
    end
  end
end

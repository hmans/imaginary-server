class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :title

      t.timestamps
    end
  end
end

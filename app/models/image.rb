class Image < ActiveRecord::Base
  attr_accessible :name

  validates :bucket_id,
    presence: true

  validates :name,
    presence: true

  belongs_to :bucket
end

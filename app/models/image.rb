class Image < ActiveRecord::Base
  attr_accessible :name, :image

  validates :bucket_id,
    presence: true

  validates :name,
    presence: true

  validates :image,
    presence: true

  has_image :image
  belongs_to :bucket
end

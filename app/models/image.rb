class Image < ActiveRecord::Base
  attr_accessible :name, :image, :image_url

  validates :bucket_id,
    presence: true

  validates :name,
    presence: true,
    uniqueness: { scope: :bucket_id }

  validates :image,
    presence: true

  has_image :image
  belongs_to :bucket

  before_validation(on: :create) do
    if name.blank?
      self.name = "#{SecureRandom.hex(20)}.#{image.format || 'jpg'}"
    end
  end
end

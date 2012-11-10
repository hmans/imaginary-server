class Image < ActiveRecord::Base
  attr_accessible :name, :image, :image_url

  validates :bucket_id,
    presence: true

  validates :name,
    presence: true,
    uniqueness: { scope: :bucket_id },
    format: { with: /^[a-z0-9]*$/ }

  validates :image,
    presence: true

  has_image :image
  belongs_to :bucket

  before_validation(on: :create) do
    if name.blank?
      self.name = "#{SecureRandom.hex(16)}"
    end
  end

  def to_param
    name
  end
end

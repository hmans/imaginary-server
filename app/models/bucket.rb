class Bucket < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    presence: true,
    uniqueness: true

  has_many :images,
    dependent: :destroy

  def to_param
    name
  end
end

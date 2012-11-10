class Bucket < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    presence: true,
    uniqueness: true,
    format: { with: /^[\-_a-z0-9]*$/ }

  has_many :images,
    dependent: :destroy

  def to_param
    name_was
  end
end

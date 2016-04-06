class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }

  validates :title, presence: true

  def main_image
    self.product_images.main
  end

  def sub_image
    self.product_images.sub
  end
end

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }

  validates :title, presence: true

  def main_image
    product_images.main[0]
  end

  def sub_image(num)
    product_images.sub[num]
  end
end

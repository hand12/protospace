class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_images
  has_many :likes
  has_many :comments
  accepts_nested_attributes_for :product_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }
  acts_as_taggable

  validates :title, presence: true

  def main_image
    product_images.main[0]
  end

  def main_image_url
    product_images.main[0].image_url if main_image
  end

  def sub_image(num)
    product_images.sub[num]
  end

  def sub_image_url(num)
    product_images.sub[num].image_url if sub_image(num)
  end

  def sub_image_id(num)
    product_images.sub[num].id if sub_image(num)
  end

end

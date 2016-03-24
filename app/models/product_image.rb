class ProductImage < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ImageUploader
  enum status: { main: 0, sub: 1, sub2: 2 }
end

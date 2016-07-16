class ProductImage < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ImageUploader
  enum status: %w(main sub)
  validates :image, presence: true
end

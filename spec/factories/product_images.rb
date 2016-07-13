FactoryGirl.define do
  factory :product_image do
    product
    image {Faker::File.file_name('path/to')}
  end
end

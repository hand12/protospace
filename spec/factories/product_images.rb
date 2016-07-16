include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :product_image do
    product
    # image {Faker::File.file_name('path/to', 'sample', 'jpg')}
    image {fixture_file_upload("spec/fixtures/img/sample.jpg")}

    trait :set_status_main do
      status "main"
    end

    trait :set_status_sub do
      status "sub"
    end

  end
end

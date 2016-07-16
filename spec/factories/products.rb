FactoryGirl.define do
  factory :product do
    title {Faker::Name.title}
    catchcopy {Faker::Lorem.sentence}
    concept {Faker::Lorem.paragraph}
    trait :with_comments do
      transient do
        comments_count 5
      end
      after(:create) do |product, evaluator|
        product.comments << create_list(:comment, evaluator.comments_count)
      end
    end

    trait :with_likes do
      transient do
        likes_count 5
      end

      after(:create) do |product, evaluator|
        product.likes << create_list(:like, evaluator.likes_count)
      end
    end

    trait :with_images do
      transient do
        images_count 3
      end

      after(:create) do |product, evaluator|
        product.product_images << create(:product_image, :set_status_main)
        product.product_images << create_list(:product_image, evaluator.images_count, :set_status_sub)
      end
    end

  end
end

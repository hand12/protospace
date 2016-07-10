FactoryGirl.define do
  factory :product do
    title {Faker::Name.title}
    catchcopy {Faker::Lorem.sentence}
    concept {Faker::Lorem.paragraph}

    trait :with_comments do
      #モデルに関係に保存されない値をセットすることができる
      transient do
        comments_count 0
      end

      after(:create) do |product|
        product.comments << create_list(:comment, 5)
      end
    end

    trait :with_likes do
      transient do
        likes_count 0
      end

      after(:create) do |product|
        product.likes << create_list(:like, 5)
      end
    end

  end
end

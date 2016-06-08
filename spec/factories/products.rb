FactoryGirl.define do
  factory :product do
    title {Faker::Name.title}
    catchcopy {Faker::Lorem.sentence}
    concept {Faker::Lorem.paragraph}

    # trait :with_comment do
    #   comment
    # end

    after(:create) { |product|
      product.comments << create(:comment)
    }


  end

  factory :comment, class: Comment do
    comment {Faker::Lorem.sentence}
  end

end

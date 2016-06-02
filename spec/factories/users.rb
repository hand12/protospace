FactoryGirl.define do

  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    avatar {Faker::Avatar.image("my-own-slug", "50x50", "jpg")}
    member {Faker::Company.name}
    profile {Faker::Lorem.sentence}
    work {Faker::Company.profession}
    password "password"
    password_confirmation "password"
  end

end

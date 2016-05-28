FactoryGirl.define do

  factory :user do
    name "yusuke"
    email "aaa@gmail.com"
    avatar "sample.jpg"
    member "sample_member"
    profile "sample_profile"
    work "sample_work"
    password "12345678"
    password_confirmation "12345678"
  end

end
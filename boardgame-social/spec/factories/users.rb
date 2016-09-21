require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.bgg_username {Faker::Name.first_name}
    f.email {Faker::Internet.email}
    f.password {"123abc"}
  end
end

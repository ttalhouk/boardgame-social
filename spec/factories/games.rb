require 'faker'

FactoryGirl.define do
  factory :game do |f|
    f.name {Faker::Commerce.product_name}
    f.image {Faker::Avatar.image}
    f.description {Faker::Hipster.paragraphs}
    f.bgg_link {Faker::Internet.url}
    f.bgg_id {Faker::Number.between(1, 7000)}
  end
end

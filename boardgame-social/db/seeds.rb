# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

games_list = Game.all

10.times do
  user = User.create(
    {
      bgg_username: Faker::Name.first_name,
      email: Faker::Internet.email,
      image: Faker::Avatar.image,
      password: "default"
    }
  )
  games_list.sample(5).each { |game| user.games << game }
end

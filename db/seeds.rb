# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all
City.delete_all
Tag.delete_all
Gossip.delete_all

10.times do
    City.create!(
        city_name: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
    )
end

City.create!(
    city_name: "New York Upper East Side",
    zip_code: "10028",
)


10.times do |i|
name = Faker::Name.first_name
password = "motdepasse123"
User.create!(
    first_name: name, 
    last_name: Faker::Name.last_name, 
    description: Faker::TvShows::MichaelScott.quote,
    email: "#{name}#{i}@gmail.com",
    age: Faker::Number.between(from: 18, to: 50),
    city: City.all.sample,
    password: password,
    password_confirmation: password,
    )
end

10.times do 
    Tag.create!(
        title: Faker::Food.fruits,
    )
end

20.times do |i|
    gossip = Gossip.create!(
        title: "Gossip n°#{i}",
        content: Faker::Lorem.paragraph(sentence_count: 3),
        user: User.all.sample,
    )
    gossip.tags << Tag.all.sample(2)
end

User.create!(
    first_name: "Gossip Girl", 
    last_name: "Dan Humpfrey", 
    description: "Who am I ? That's a secret I'll never tell. You know you love me, xoxo, Gossip Girl",
    email: "gossipgirl@gmail.com",
    age: 16,
    city: City.all.sample,
    password: "gossipgirl",
    password_confirmation: "gossipgirl"
)

40.times do 
    Comment.create!(
        content: Faker::TvShows::BojackHorseman.quote,
        user: User.last,
        gossip: Gossip.all.sample

    )
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#(2..5).each { |i| user = User.create(username: "User#{i}", 
#                                     picture: "user#{i}.jpg", 
#                                     email: "user#{i}@user.com", 
#                                     password: "12345")
#}
Tweet.destroy_all
400.times do
    tweet = Tweet.create(content: Faker::Internet.user_agent, user_id: rand(5))
end
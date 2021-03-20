# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).to_a.each do |i| 
    user = User.create!( username: "User#{i}", 
                        picture: "user#{i}.jpg", 
                        email: "user#{i}@user.com", 
                        password: "123456")
    puts "Se ha creado el usuario #{user.username}"
end

400.times do
    tweet = Tweet.create(content: Faker::Internet.user_agent, user_id: rand(5))
    puts "Se ha creado un tweet"
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@user.com', password: '123456', password_confirmation: '123456') if Rails.env.development?
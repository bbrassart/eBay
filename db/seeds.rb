
puts " --- Deleting all Users --- "
User.destroy_all
puts " --- Deleting all Products (MUHAHAHAHAHAA) --- "
Product.destroy_all


user1 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')
user2 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')
user3 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')

3.times do |product|
user1.products.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning))
end

3.times do |product|
user2.products.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning))
end

3.times do |product|
user3.products.create!(title: Faker::Lorem.words(2), description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning))
end
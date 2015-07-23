
puts " --- Deleting all Users --- "
User.destroy_all
puts " --- Deleting all Products (MUHAHAHAHAHAA) --- "
Product.destroy_all

user4 = User.create!(name: 'Bart', email: 'bart@gmail.com', password: 'bart', password_confirmation: 'bart')
user1 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')
user2 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')
user3 = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password: '123', password_confirmation: '123')

3.times do |product|
  user1.products.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning), price: Faker::Number.number(3))
end

3.times do |product|
  user2.products.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning), price: Faker::Number.number(3))
end

3.times do |product|
  user3.products.create!(title: Faker::Lorem.words(2).join(''), description: Faker::Lorem.sentence(3, true), deadline: Faker::Time.forward(800, :morning), price: Faker::Number.number(3))
end


30.times do |review|
  p = Product.find_by_id(rand(Product.first.id..Product.last.id))
  p.reviews.create!(user: User.find_by_id(rand(User.first.id..User.last.id)), content: Faker::Lorem.sentence(3, true))
  p = Product.find_by_id(rand(Product.first.id..Product.last.id))
  p.bids.create!(user: User.find_by_id(rand(User.first.id..User.last.id)), amount: (p.price + Faker::Number.between(1, 100)))
end
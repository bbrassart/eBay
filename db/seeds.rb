# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
puts " --- Deleting all Users --- "
# this does also delete the Entries --> dependent: :destroy
User.destroy_all
puts " --- Deleting all Products (MUHAHAHAHAHAA) --- "
# this does also delete the Entries --> dependent: :destroy

# rubocop:enable all


def create_products_for(user)
  Product.create!(
    user:  user,    # yes, we can pass in the object instead of the id
    title: 'blablabalba',
    description: 'description',
    deadline:  rand(0..59)
  )
end


25.times do |number|
  user = User.create!(
    name: "User #{number}",
    email: "Email #{number}"
  )

  rand(1..6).times do
    create_products_for(user)
  end
end


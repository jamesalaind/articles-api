# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(name: 'test', username: 'test', email: 'test@example.com', password: 'test123', password_confirmation: 'test123')
if user.save
  puts json: user, status: :created
else
  puts json: { errors: user.errors.full_messages },
         status: :unprocessable_entity
end
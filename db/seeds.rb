# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
puts "Cleaning database..."
User.destroy_all

puts "Creating Users..."
david = {name: "David", email: "david@gmail.com", password: "123456"}
teckguan = {name: "Teckguan", email: "teckguan@gmail.com", password: "123456"}
pingyu = {name: "Pingyu", email: "pingyu@gmail.com", password: "123456"}
yaya = {name: "Yaya", email: "yaya@gmail.com", password: "123456"}


users = [david, teckguan, pingyu, yaya]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"

  puts " #{user.name} Creating items..."
  phone = Item.create({name: "phone", price: 5.50, category: "Electronics", user: user })
  teddybear = Item.create({name: "teddybear", price: 17.50, category: "Toys", user: user })
  user.items.each do |item|
    puts "#{item.name}"
  end
end

# CATEGORIES = ["Electronics", "Clothing", "Books", "Home Decor", "Toys"]
puts "Finished!"

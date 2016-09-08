# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Business.destroy_all
Category.destroy_all
User.destroy_all

u1 = User.create!(name: "owner", email: "owner@mail.cl", role: 1, id: 1, password: "owner111")
u2 = User.create!(name: "owner2", email: "owner2@mail.com", role: 1, id: 2, password: "owner222")
u3 = User.create!(name: "Admin", email: "admin@mail.cl", role: 2, id: 3, password: "admin123")
u4 = User.create!(name: "Member", email: "member@mail.cl", role: 0, id: 4, password: "member111")

Business.create!(name: Faker::Company.name, id: 1, description: Faker::Company.catch_phrase, email: Faker::Internet.email, user_id: 2)
Business.create!(name: Faker::Company.name, id: 2, description: Faker::Company.catch_phrase, email: Faker::Internet.email, user_id: 1)

c1 = Category.create!(name: "Artesanía")
c2 = Category.create!(name: "Pastelería")

5.times do
  Product.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: 0, business_id: 1, highlighted: true, category: c1)
  Product.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: 0, business_id: 1, highlighted: false, category: c2)
  Product.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: 0, business_id: 2, highlighted: false, category: c1)
  Product.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: 0, business_id: 2, highlighted: true, category: c2)
end

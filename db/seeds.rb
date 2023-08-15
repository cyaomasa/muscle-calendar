# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "admin-muscle@ggg",
    password: "111111"
  )
  
Category.create!(
    name: "胸"
  )
  Category.create!(
    name: "肩"
  )
  Category.create!(
    name: "背中"
  )
  Category.create!(
    name: "腕"
  )
  Category.create!(
    name: "腹"
  )
  Category.create!(
    name: "脚"
  )
  Category.create!(
    name: "上半身"
  )
  Category.create!(
    name: "下半身"
  )
  Category.create!(
    name: "その他"
  )

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
  name: "胸",
  id: 1
)
Category.create!(
  name: "肩",
  id: 2
)
Category.create!(
  name: "背中",
  id: 3
)
Category.create!(
  name: "腕",
  id: 4
)
Category.create!(
  name: "腹",
  id: 5
)
Category.create!(
  name: "脚",
  id: 6
)
Category.create!(
  name: "上半身",
  id: 7
)
Category.create!(
  name: "下半身",
  id: 8
)
Category.create!(
  name: "その他",
  id: 9
)

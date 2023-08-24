FactoryBot.define do
  factory :post_record do
    post_status { 0 }
    training_name { Faker::Lorem.characters(number: 10) }
    set_count { Faker::Lorem.characters(number: 1) }
    weight { Faker::Lorem.characters(number: 2) }
    rep_count { Faker::Lorem.characters(number: 2) }
    start_time { Date.today }
    availability { 0 }
    category_id { 1 }
    user_id { 1 }
    user
  end
end

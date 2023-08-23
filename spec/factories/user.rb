FactoryBot.define do
  factory :user do
    name { 'サンプル1' }
    email { 'sample@email.sample' }
    password { "password" }
    encrypted_password { "password" }
  end
end

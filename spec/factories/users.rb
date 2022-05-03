FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { "s3" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '一郎' }
    ruby_last_name        { 'スズキ' }
    ruby_first_name       { 'イチロウ' }
    birth_date            { '1930-01-01' }
  end
end

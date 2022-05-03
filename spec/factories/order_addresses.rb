FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    province_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    house_number{ Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_number {Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11))}
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

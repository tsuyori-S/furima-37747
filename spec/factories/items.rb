FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    information { Faker::Lorem.sentence }
    category_id { '2' }
    state_id { '2' }
    delivery_fee_id { '2' }
    province_id { '2' }
    delivery_time_id { '2' }
    price { '10000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end

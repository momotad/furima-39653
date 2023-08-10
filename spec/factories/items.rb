FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    content { Faker::Commerce.department }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    cost_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample.jpg'), filename: 'sample.jpg')
    end
  end
end

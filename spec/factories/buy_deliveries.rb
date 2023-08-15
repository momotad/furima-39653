FactoryBot.define do
  factory :buy_delivery do
    postcode { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    city { '大阪市' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone { '08011111111' }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

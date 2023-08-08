FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1,) }
    password_confirmation {password}
    last_name {"日本"}
    first_name {"大阪"}
    last_name_kana {"ニホン"}
    first_name_kana {"オオサカ"}
    birthday { Faker::Date.backward }
  end
end
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {'テスト'}
    first_name            {'テスト'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birthdate             {'2000-01-01'}
  end
end
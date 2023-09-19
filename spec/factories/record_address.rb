FactoryBot.define do
  factory :record_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京市' }
    address          { '1-2-3' }
    building         { 'ビル名なし' }
    phone_number     { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
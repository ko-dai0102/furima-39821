FactoryBot.define do
  factory :item do
    name          {Faker::Commerce.product_name}
    info          {Faker::Lorem.sentence}
    category_id   {2}
    status_id     {2}
    charge_id     {2}
    prefecture_id {2}
    schedule_id   {2}
    price         {300}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'item-sample.png')), filename: 'item-sample.png')
    end
  end
end
FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    category_id { 2 }
    status_id { 2 }
    description { 2 }
    delivery_charge_id { 2 }
    shipment_source_id { 2 }
    shipping_day_id { 2 }
    price { 2000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end

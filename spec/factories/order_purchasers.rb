FactoryBot.define do
  factory :order_purchaser do
    item_id { 1 }
    user_id { 1 } 
    postal_code { "222-2222" }
    prefectures { 14 }
    municipality { "東京都練馬区" }
    address { "aa@aa" }
    phone_number { "08012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
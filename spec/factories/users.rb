FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    last_name  { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    email { Faker::Internet.free_email }
    password { 'Pa2020' }
    password_confirmation { password }
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end

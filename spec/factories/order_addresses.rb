FactoryBot.define do
  factory :order_address do
    user_id { 1 }
    item_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { rand(1..47) }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '090-1234-5678' }
  end
end

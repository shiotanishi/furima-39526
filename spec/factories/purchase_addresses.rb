FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { 'テスト市' }
    address { 'テスト町1-2-3' }
    building_name { 'テストビル101号室' }
    telephone_number { '090-1234-5678' }
    association :purchase
    price {3000}
    token { 1 }
  end
end
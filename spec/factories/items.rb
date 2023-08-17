FactoryBot.define do
  factory :item do
    item_name { '商品名テスト' }
    info          {'これは商品の説明です。'}
    price              { 1000 }
    category_id          { 2 }
    condition_id            { 2 }
    shipping_fee_id            { 2 }
    prefecture_id            { 2 }
    scheduled_delivery_id             { 2 }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end   
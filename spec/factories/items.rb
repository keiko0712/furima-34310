FactoryBot.define do
  factory :item do
    image                      {Faker::Lorem.sentence}
    name                       {'名前'}
    description_of_item        {'説明'}
    price                      {'10000'}
    category_id                {2}
    item_status_id             {2}
    delivery_charge_id         {2}
    shipping_area_id           {2}
    estimated_shipping_date_id {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

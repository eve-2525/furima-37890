FactoryBot.define do
  factory :item do
    product { Faker::Lorem.sentence }
    product_description { 'アイウエオ' }
    category_id { '7' }
    condition_id { '4' }
    postage_id { '2' }
    area_id { '25' }
    number_of_days_id { '3' }
    price { '500' }
    user { FactoryBot.create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

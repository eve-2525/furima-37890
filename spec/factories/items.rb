FactoryBot.define do
  factory :item do
    product              {'あいうえお'}
    product_description                 {'アイウエオ'}
    category_id              {'7'}
    condition_id              {'2'}
    postage_id                 {'1'}
    area_id              {'25'}
    number_of_days_id              {'3'}
    price                 {'500'}
    image              {}

  end
end
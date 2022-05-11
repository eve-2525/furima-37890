FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    area_id { 3 }
    city { 'aiueo' }
    block_number { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '05055555555' }
  end
end

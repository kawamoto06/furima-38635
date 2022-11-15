FactoryBot.define do
  factory :order_ship do
  token {"tok_abcdefghijk00000000000000000"}
  post_code {"111-1111"}
  prefecture_id { 2 }
  city {Faker::Address.city}
  address {Faker::Address.street_address}
  building_name {"建物"}
  phone_number {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"} 
  end
end
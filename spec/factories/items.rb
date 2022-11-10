FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    name          {"名前"}
    text          {"説明"}
    price              {2000}
    condition_id       {2}
    category_id        {2}
    prefecture_id      {2}
    shipping_cost_id   {2}
    shipping_date_id   {2}
    association :user
    
  end
end

FactoryBot.define do
  factory :furima do
    furima_name                 {'テスト'}
    description                 {'テスト'}
    category_id                 {2}
    status_id                   {2}
    delivery_charge_id          {2}
    area_id                     {2}
    day_id                      {2}
    price                       {500}
    association                 :user
  end
end
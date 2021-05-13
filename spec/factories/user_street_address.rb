FactoryBot.define do
  factory :user_street_address do
    postal                 {"123-4567"}
    municipality           {"テスト"}
    address                {"テスト"}
    building_name          {"テスト"}
    phone_number           {"09012345678"}
    area_id                {2}
    token                  {1}
  end
end

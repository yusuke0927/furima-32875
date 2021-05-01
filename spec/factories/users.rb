FactoryBot.define do
  factory :user do
    nick_name                         {'test'}
    email                             {'test@test'}
    password                          {password}
    password_confirmation             {password}
    name_chinese_character_last_name  {'てすと'}
    name_chinese_character_first_name {'てすと'}
    name_catakana_last_name           {'テスト'}
    name_catakana_first_name          {'テスト'}
    birthday                          {'0000-00-00'}
  end
end
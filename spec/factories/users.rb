FactoryBot.define do
  factory :user do
    nick_name                         {'test'}
    email                             {Faker::Internet.free_email}
    password                          {'111aaa'}
    password_confirmation             {'111aaa'}
    name_chinese_character_last_name  {'山田'}
    name_chinese_character_first_name {'太郎'}
    name_catakana_last_name           {'ヤマダ'}
    name_catakana_first_name          {'タロウ'}
    birthday                          {'2000-12-12'}
  end
end
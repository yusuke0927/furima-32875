require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nick_nameが空だと保存できない" do
      user = FactoryBot.build(:user)
      user.nick_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "name_chinese_character_last_nameが全角日本語以外だと保存できない" do
      user = FactoryBot.build(:user)
      user.name_chinese_character_last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name_chinese_character_last_name is invalid")
    end
    it "name_chinese_character_first_nameが全角日本語以外だと保存できない" do
      user = FactoryBot.build(:user)
      user.name_chinese_character_first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name_chinese_character_first_name is invalid")
    end
    it "name_catakana_last_nameが全角カタカナ以外だと保存できない" do
     user = FactoryBot.build(:user)
     user.name_catakana_last_name = ''
     user.valid?
     expect(user.errors.full_messages).to include("Name_catakana_last_name is invalid")
    end
    it "name_catakana_first_nameが全角カタカナ以外だと保存できない" do
     user = FactoryBot.build(:user)
     user.name_catakana_first_name = ''
     user.valid?
     expect(user.errors.full_messages).to include("Name_catakana_first_name is invalid")
    end
    it "birthdayが空だと保存できない" do
     user = FactoryBot.build(:user)
     user.birthday = ''
     user.valid?
     expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "emailが空だと保存できない" do
     user = FactoryBot.build(:user)
     user.email = ''
     user.valid?
     expect(user.errors.full_messages).to include("Email")
    end
  end
end

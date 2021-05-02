require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context 'ユーザー新規登録できるとき' 
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it "nick_nameが入力できていれば登録できる" do
      @user.nick_name = 'test'
      expect(@user).to be_valid
    end
    it "name_chinese_character_last_nameが全角日本語で入力できていれば登録できる" do
      @user.name_chinese_character_last_name = '山田'
      expect(@user).to be_valid
    end
    it "name_chinese_character_first_nameが全角日本語で入力できていれば登録できる" do
      @user.name_chinese_character_first_name = '太郎'
      expect(@user).to be_valid
    end
    it "name_catakana_last_nameが全角カタカナで入力できていれば登録できる" do
      @user.name_catakana_last_name = 'ヤマダ'
      expect(@user).to be_valid
    end
    it "name_catakana_first_nameが全角カタカナで入力できていれば登録できる" do
      @user.name_catakana_first_name = 'タロウ'
      expect(@user).to be_valid
    end
    it "birthdayが入力できていれば登録できる" do
      @user.birthday = '2000-12-12'
      expect(@user).to be_valid
    end
    it "3つの条件を満たせばemailは登録できる" do
      @user.email = 'test@test'
      expect(@user).to be_valid
    end
    it "4つの条件を満たせばpasswordは登録できる" do
      @user.password = '111aaa'
      expect(@user).to be_valid
    end
  end

   context 'ユーザー新規登録できないとき' 
    it "nick_nameが空だと保存できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "name_chinese_character_last_nameが全角日本語以外だと保存できない" do
      @user.name_chinese_character_last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name chinese character last name is invalid")
    end

    it "name_chinese_character_last_nameが空だと保存できない" do
      @user.name_chinese_character_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name chinese character last name can't be blank", "Name chinese character last name is invalid")
    end

    it "name_chinese_character_first_nameが全角日本語以外だと保存できない" do
      @user.name_chinese_character_first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name chinese character first name is invalid")
    end

    it "name_chinese_character_first_nameが空だと保存できない" do
      @user.name_chinese_character_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name chinese character first name can't be blank", "Name chinese character first name is invalid")
    end

    it "name_catakana_last_nameが全角カタカナ以外だと保存できない" do
     @user.name_catakana_last_name = 'a'
     @user.valid?
     expect(@user.errors.full_messages).to include("Name catakana last name is invalid")
    end

    it "name_catakana_last_nameが空だと保存できない" do
      @user.name_chinese_character_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name chinese character last name can't be blank", "Name chinese character last name is invalid")
    end

    it "name_catakana_first_nameが全角カタカナ以外だと保存できない" do
     @user.name_catakana_first_name = 'a'
     @user.valid?
     expect(@user.errors.full_messages).to include("Name catakana first name is invalid")
    end

    it "name_catakana_first_nameが空だと保存できない" do
      @user.name_catakana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name catakana first name can't be blank", "Name catakana first name is invalid")
    end

    it "birthdayが空だと保存できない" do
     @user.birthday = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "emailが空だと保存できない" do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "同じemailは登録できない" do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "@を含まないemailは登録できない" do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordは半角数字のみでは保存できない" do
     @user.password = '111111'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "passwordが空だと保存できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは半角英語のみでは保存できない" do
     @user.password = 'aaaaaa'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "passwordは全角英数字混合は保存できない" do
      @user.password = 'ａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
  end
end

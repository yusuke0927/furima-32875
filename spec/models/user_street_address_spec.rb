require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima)
    @user_street_address = FactoryBot.build(:user_street_address, user_id: @user.id, furima_id: @furima.id)
    
  end

  describe "商品購入機能" do
    context '商品が購入できるとき' do
     it '全ての項目が条件通り入力できていれば購入できる' do
       expect(@user_street_address).to be_valid
     end

     it 'postalが入力できていれば登録できる' do
       @user_street_address.postal = '123-4567'
       expect(@user_street_address).to be_valid
     end

     it 'municipalityが入力できていれば登録できる' do
       @user_street_address.municipality = 'テスト'
       expect(@user_street_address).to be_valid
     end

     it 'addressが入力できていれば登録できる' do
       @user_street_address.address = 'テスト'
       expect(@user_street_address).to be_valid
     end

     it 'building_nameが入力できていれば登録できる' do
       @user_street_address.building_name = 'テスト'
       expect(@user_street_address).to be_valid
     end

     it 'building_nameが空でも登録できる' do
       @user_street_address.building_name = ''
       expect(@user_street_address).to be_valid
     end

     it 'area_idが選択できていれば登録できる' do
       @user_street_address.area_id = 2
       expect(@user_street_address).to be_valid
     end

     it 'phone_numberが入力できていれば登録できる' do
       @user_street_address.phone_number = '09012345678'
       expect(@user_street_address).to be_valid
     end

     context '商品が購入できないとき' do
       it 'postalが空だと登録できない' do
         @user_street_address.postal = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Include hyphen(-)")
       end

       it 'postalに(-)がなければ登録できない' do
         @user_street_address.postal = '1234567'
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
       end

       it 'municipalityが空だと登録できない' do
         @user_street_address.municipality = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Municipality can't be blank")
       end

       it 'addressが空だと登録できない' do
         @user_street_address.address = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Address can't be blank")
       end

       it 'phone_numberが空だと登録できない' do
         @user_street_address.phone_number = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Phone number can't be blank")
       end

       it 'phone_numberに(-)が入っていると登録できない' do
         @user_street_address.phone_number = '090-1234-5678'
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberが9桁以下だと登録できない' do
         @user_street_address.phone_number = '1'
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberが12桁以上だと登録できない' do
         @user_street_address.phone_number = '090123456789'
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Phone number is invalid")
       end

       it 'area_idが未選択の場合、登録できない' do
         @user_street_address.area_id = '1'
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Area can't be blank")
       end

       it 'tokenがないと購入できない' do
         @user_street_address.token = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Token can't be blank")
       end

       it 'user_idがないと購入できない' do
         @user_street_address.user_id = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("User can't be blank")
       end

       it 'furima_idがないと購入できない' do
         @user_street_address.furima_id = ''
         @user_street_address.valid?
         expect(@user_street_address.errors.full_messages).to include("Furima can't be blank")
       end
     end
    end
  end
end
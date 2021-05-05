require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe "商品出品機能" do
    context '商品が出品できるとき' do
     it '全ての項目が条件通り入力できていれば出品できる' do
       expect(@furima).to be_valid
     end

     it 'furima_nameが入力できていれば登録できる' do
       @furima.furima_name = 'テスト'
       expect(@furima).to be_valid
     end

     it 'descriptionが入力できていれば登録できる' do
       @furima.description = 'テスト'
       expect(@furima).to be_valid
     end

     it 'category_idが選択できていれば登録できる' do
       @furima.category_id = 2
       expect(@furima).to be_valid
     end

     it 'status_idが選択できていれば登録できる' do
       @furima.status_id = 2
       expect(@furima).to be_valid
     end

     it 'delivery_charage_idが選択できていれば登録できる' do
       @furima.delivery_charge_id = 2
       expect(@furima).to be_valid
     end

     it 'area_idが選択できていれば登録できる' do
       @furima.area_id = 2
       expect(@furima).to be_valid
      end

      it 'day_idが選択できていれば登録できる' do
        @furima.day_id = 2
        expect(@furima).to be_valid
      end

      it '出品商品の料金、¥300~¥9999999内の半角数字であれば出品できる' do
        @furima.price = 500
        expect(@furima).to be_valid
      end

      context '商品が出品出来ないとき' do
        it 'furima_nameが空だと登録できない' do
          @furima.furima_name = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Furima name can't be blank")
        end

        it 'descriptionが空だと登録できない' do
          @furima.description = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Description can't be blank")
        end

        it 'category_idが未選択のままだと登録できない' do
          @furima.category_id = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Category is not a number")
        end

        it 'category_id項目の---を選択すると登録できない' do
          @furima.category_id = 1
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Category must be other than 1")
        end

        it 'status_idが未選択のままだと登録できない' do
          @furima.status_id = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Status is not a number")
        end

        it 'status_id項目の---を選択すると登録できない' do
          @furima.status_id = 1
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Status must be other than 1")
        end

        it 'delivery_charge_idが未選択のままだと登録できない' do
          @furima.delivery_charge_id = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Delivery charge is not a number")
        end

        it 'delivery_charge_id項目の---を選択すると登録できない' do
          @furima.delivery_charge_id = 1
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Delivery charge must be other than 1")
        end

        it 'area_idが未選択のままだと登録できない' do
          @furima.area_id = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Area is not a number")
        end

        it 'area_id項目の---を選択すると登録できない' do
          @furima.area_id = 1
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Area must be other than 1")
        end

        it 'day_idが未選択のままだと登録できない' do
          @furima.day_id = ''
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Day is not a number")
        end

        it 'day_id項目の---を選択すると登録できない' do
          @furima.day_id = 1
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Day must be other than 1")
        end

        it 'priceが¥300以下だと出品できない' do
          @furima.price = 100
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが¥9,999,999以上だと出品できない' do
          @furima.price = 10000000
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceが全角数字の場合、出品できない' do
          @furima.price = '５００'
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price is not a number")
        end

        it '商品に紐づいているユーザーが無い場合出品できない' do
          @furima.user = nil
          @furima.valid?
          expect(@furima.errors.full_messages).to include("User must exist")
        end
      end
    end
  end



  end
require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end    

  describe 'バリデーション' do
    context '全ての情報が正しく入力されている場合' do
      it '@purchase_addressが有効であること' do
        expect(@purchase_address).to be_valid
      end
    
      
      it '建物名が空でも登録できる' do
        @purchase_address.building_name  = ''
        expect(@purchase_address).to be_valid
      end
   end

    context '情報が不足している場合' do
      it 'post_codeが空では無効であること' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '「3桁ハイフン4桁」の半角文字列でない場合は無効であること' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが空では無効であること' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では無効であること' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では無効であること' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空では無効であること' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '9桁以下の場合登録できない' do
        @purchase_address.telephone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid. Enter a valid phone number")
      end
      
      it '12桁以上の場合登録できない' do
        @purchase_address.telephone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid. Enter a valid phone number")
      end

     it '半角数字以外が含まれている場合登録できない' do
        @purchase_address.telephone_number = '090abcd5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid. Enter a valid phone number")
      end

      it 'userが紐づいていない場合登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていない場合登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      
      it "tokenが空では登録できないこと" do
        @purchase_address.token =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


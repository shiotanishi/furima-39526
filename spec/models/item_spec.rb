require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品出品機能' do
    context  '商品出品ができる場合' do
      it 'item_nameとinfo、priceとcategory_id、condition_id、shipping_fee_id、prefecture_id、scheduled_delivery_idとuser_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end
   
    context  '商品出品ができない場合' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        
       expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
    end

    it '商品名が空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item name can't be blank")
    end

    
    it '商品の説明が空では出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info can't be blank")
    end

   

    it 'カテゴリーが空では出品できない' do
      @item.category_id  = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category is reserved")
    end

    it '商品の状態が空では出品できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Condition is reserved")
    end

    

    it '配送料の負担が空では出品できない' do
      @item.shipping_fee_id = '1'
      @item.valid?
      
      expect(@item.errors.full_messages).to include ("Shipping fee is reserved")
    end
  

      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is reserved")
      end

      it '発送までの日数が空では出品できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery is reserved")
      end
  

      it '販売価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    
      it '販売価格が半角数字でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is not a number")
      end
    
      it '販売価格が設定範囲外では出品できない' do
        @item.price = 299  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        
        @item.price = 10_000_000  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
  
  end
end
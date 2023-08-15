require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品の情報' do
    context  '商品出品ができる場合' do
      it 'item_nameとinfo、priceとcategory_id、condition_id、shipping_fee_id、prefecture_id、scheduled_delivery_idとuser_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end
   
    context  '商品出品ができない場合' do
      it '商品画像が空では出品できない' do
        @item.item_image = ''
        @item.valid?
       expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
    end

    it '商品名が空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    end

    it '商品名が40文字以上では出品できない' do
      @item.item_name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank(maximum is 40 characters)")
    end  

    it '商品の説明が空では出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info can't be blank")
    end

    it '商品の説明が1000文字以上では出品できない' do
      @item.item_name = 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include ("Info can't be blank(maximum is 1000 characters)")
    end
  end

  describe '商品の詳細' do
      before do
        @item = FactoryBot.build(:user)
      end

    it 'カテゴリーが空では出品できない' do
      @item.category_id  = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end
    it '商品の状態が空では出品できない' do
      @item.condition_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Sales status can't be blank")
    end

  describe '配送について' do
      before do
        @item = FactoryBot.build(:user)
      end

    it 'カテゴリーが空では出品できない' do
      @item.category_id  = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
    end

    it '配送料の負担が空では出品できない' do
      @item.shipping_fee_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Shipping fee status can't be blank
        ")
    end
  end

  describe '発送元の地域' do
    before do
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では出品できない' do
        @item.scheduled_delivery_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
  end


  describe '販売価格' do
      before do
        it '販売価格が空では出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
    
        it '販売価格が半角数字でなければ出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end
    
        it '販売価格が設定範囲外では出品できない' do
          @item.price = 299  
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        
          @item.price = 10_000_000  
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
      end
  end

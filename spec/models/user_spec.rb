require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
   
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email= 'invalid_email'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Password can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'Aあア阿'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end


 
  describe '本人情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "Last name can't be blank"
    end
  
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'Tarou' # 半角文字列をセット
      @user.last_name = 'Yamada' # 半角文字列をセット
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid", "Last name is invalid"
    end
  
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_kana = ''
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank", "Last kana can't be blank"
    end
  
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_kana = 'たろう' # ひらがなをセット
      @user.last_kana = 'やまだ' # ひらがなをセット
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana is invalid", "Last kana is invalid"
    end
  
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end 
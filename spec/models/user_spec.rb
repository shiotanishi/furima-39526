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
end

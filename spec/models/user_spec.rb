require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick_name can't be blank"
    end

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
   
    it 'メールアドレスが一意性であること' do
      @user.email ='test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "has already been taken"
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email= 'invalid_email'
      @user.valid?
      expect(@user.errors.full_messages).to include "is invalid"
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to  include "can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "is too short (minimum is 6 characters"
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include"should include both letters and numbers"
      end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = 'password'
      @user.password_confirmation = 'mismatch'
      @user.valid?
      expect(@user.errors.full_messages).to include"doesn't match Password"
    end
  end
end

require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context  'ユーザ登録ができる場合' do
      it 'nicknameとemail、passwordとpassword_confirmationと、first_name、last_nameとfirst_kana、last_kanaと生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
   
    context  'ユーザ登録ができない場合' do
      it 'ニックネームが空では登録できない' do
       @user.nick_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include ("Nick name can't be blank")
      end
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'メールアドレスが一意性でなければ登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include ('Email has already been taken')
    end

    it 'メールアドレスは、@を含んでいなければ登録できない' do
      @user.email = 'invalid_email'
      @user.valid?
      expect(@user.errors.full_messages).to include ('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'パスワードは、6文字以上でなければ登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include ('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力でなければ登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ('Password is invalid')
    end
    

    it 'パスワードとパスワード（確認）は、値の一致でなければ登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'お名前(全角)は、名字が必須でなければ登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'お名前(全角)は、名前が必須でなければ登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  ("Last name can't be blank")
    end

    it 'お名前カナ(全角)は、名字が必須でなければ登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First kana can't be blank")
    end

    it 'お名前カナ(全角)は、名前が必須でなければ登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  ("Last kana is invalid")
    end

    it '生年月日が必須でなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end
  end
end  
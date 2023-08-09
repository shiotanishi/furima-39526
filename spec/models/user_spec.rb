require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      user = User.new(nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
  end

  it 'メールアドレスが必須であること' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
   
  it 'メールアドレスが一意性であること' do
    existing_user = FactoryBot.create(:user, email: 'test@example.com')
    user = User.new(email: 'test@example.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'メールアドレスは、@を含む必要があること' do
    user = User.new(email: 'invalid_email')
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it 'パスワードが必須であること' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'パスワードは、6文字以上での入力が必須であること' do
    user = User.new(password: '12345')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it 'パスワードは、半角英数字混合での入力が必須であること' do
    user = User.new(password: 'password')
    user.valid?
    expect(user.errors[:password]).to include("should include both letters and numbers")
  end

  it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
    user = User.new(password: 'password', password_confirmation: 'mismatch')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end
end

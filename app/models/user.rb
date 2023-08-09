class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :email, presence: true
      with_options PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
        end
      with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
         validates :first_name, presence: true
         validates :last_name, presence: true
      end
      with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
         validates :first_kana, presence: true
         validates :last_kana, presence: true
      end
         validates :birthday, presence: true

end

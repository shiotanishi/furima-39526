class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :content, presence: true, unless: :was_attached?
  validates :price, presence: true, numericality: { only_integer: true }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :item_name 
    validates :info
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :user

  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }


  def was_attached?
    self.image.attached?
  end
end

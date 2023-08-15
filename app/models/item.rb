class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :price, presence: true, numericality: { only_integer: true }
  
  
  with_options presence: true do
    validates :item_name
    validates :info
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    
  end
  
end

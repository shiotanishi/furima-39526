class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :price, presence: true, numericality: { only_integer: true }
  
  
  with_options presence: true do
    validates :item_name
    validates :info
    validates :category_id, exclusion: { in: [1] }    
    validates :condition_id, exclusion: { in: [1] }
    validates :shipping_fee_id, exclusion: { in: [1] }
    validates :prefecture_id, exclusion: { in: [1] }
    validates :scheduled_delivery_id, exclusion: { in: [1] }
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  
end

class Address < ApplicationRecord
  belongs_to :purchase

  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end

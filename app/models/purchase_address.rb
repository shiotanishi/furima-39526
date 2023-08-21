class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :purchase, :item_id, :user_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
 
  end


  def save
    purchase = Purchase.create(item: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, telephone_number: telephone_number, purchase:purchase)
  end
end
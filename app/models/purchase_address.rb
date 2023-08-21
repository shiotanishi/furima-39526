class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :purchase, :item_id, :user_id
  

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone_number 
    
  
  end


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, telephone_number: telephone_number, purchase_id:purchase.id)

  end

end
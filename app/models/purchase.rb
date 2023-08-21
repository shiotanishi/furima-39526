class Purchase< ActiveRecord::Base
  validates :item_id, presence: true
  validates :user_id, presence: true


  belongs_to :item
  belongs_to :user
 
end
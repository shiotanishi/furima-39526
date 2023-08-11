class Furima < ApplicationRecord
  has_one_attached :image

  validates :text, presence: true
end

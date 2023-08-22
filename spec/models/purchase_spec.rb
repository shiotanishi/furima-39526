# require 'rails_helper'

# RSpec.describe Purchase, type: :model do
#   before do
#     @purchase = FactoryBot.build(:purchase)
#   end

#   describe '購入情報のバリデーション' do
#     context '正しく保存される場合' do
#       it 'item_idとuser_idが存在する場合に保存される' do
#         expect(@purchase).to be_valid
#       end
#     end

#     context '保存されない場合' do
#       it 'item_idが存在しない場合に保存されない' do
#         @purchase.item_id = nil
#         @purchase.valid?
#         expect(@purchase.errors.full_messages).to include("Item can't be blank")
#       end

#       it 'user_idが存在しない場合に保存されない' do
#         @purchase.user_id = nil
#         @purchase.valid?
#         expect(@purchase.errors.full_messages).to include("User can't be blank")
#       end
#     end
#   end
# end

# require 'rails_helper'

# RSpec.describe Address, type: :model do
#   before do
#     @address = FactoryBot.build(:address)
#   end

#   describe '配送先情報のバリデーション' do
#     context '正しく保存される場合' do
#       it 'post_code、prefecture_id、municipality、address、telephone_number、purchase_idが存在する場合に保存される' do
#         binding.pry
#         expect(@address).to be_valid
#       end
#     end

#     context '保存されない場合' do
#       it 'post_codeが存在しない場合に保存されない' do
#         @address.post_code = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Post code can't be blank")
#       end

#       it 'prefecture_idが存在しない場合に保存されない' do
#         @address.prefecture_id = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Prefecture can't be blank")
#       end

#       it 'municipalityが存在しない場合に保存されない' do
#         @address.municipality = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Municipality can't be blank")
#       end

#       it 'addressが存在しない場合に保存されない' do
#         @address.address = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Address can't be blank")
#       end

#       it 'telephone_numberが存在しない場合に保存されない' do
#         @address.telephone_number = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Telephone number can't be blank")
#       end

#       it 'purchase_idが存在しない場合に保存されない' do
#         @address.purchase_id = nil
#         @address.valid?
#         expect(@address.errors.full_messages).to include("Purchase can't be blank")
#       end
#     end
#   end
# end

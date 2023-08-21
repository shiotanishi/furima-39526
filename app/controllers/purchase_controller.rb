class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new

  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  private

  def purchase_params
    params.require(:purchase_address).permit(:prefecture_id, :municipality, :address, :building_name, :telephone_number, :purchase, :item_id, :user_id).merge(user_id: current_user.id)
  end




end

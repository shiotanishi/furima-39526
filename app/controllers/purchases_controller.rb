class PurchasesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :create]
  before_action :set_item_and_purchase_address, only: [:index, :create]
  before_action :set_public_key, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new

  end

  def create
    if @purchase_address.valid?
      process_payment
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token]  )
  end

  def process_payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      card: purchase_params[:token],
      currency: 'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

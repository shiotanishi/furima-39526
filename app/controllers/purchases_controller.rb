class PurchasesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :create]
  before_action :set_common_variables, only: [:index, :create]
  before_action :set_item_and_purchase_address, only: [:index, :create]
  before_action :user_check, only: [:index]
  before_action :set_gon_public_key, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new

  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
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

  def set_common_variables
    @item = Item.find(params[:item_id])
  end

  def set_item_and_purchase_address
    if !@item.purchase.nil?
      redirect_to root_path
    end
  end

  def user_check
   if @item.user.id == current_user.id
    redirect_to root_path
   end
  end

  def set_gon_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

end

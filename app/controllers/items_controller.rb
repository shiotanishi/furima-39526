class ItemsController < ApplicationController
  # before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new]



  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @item.attributes = {
      item_name: params[:item_name],
      info: params[:info],
      category_id: params[:category_id],
      condition_id: params[:condition_id],
      shipping_fee_id: params[:shipping_fee_id],
      prefecture_id: params[:prefecture_id],
      scheduled_delivery_id: params[:scheduled_delivery_id]
    }
  end

  def create
    @item =Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
           render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end

  # def edit
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   @item.update(item_params)
  #   redirect_to root_path
  # end

  # def update_user
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def show
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :info, :price, :image, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  # def move_to_inde
  #   return if user_signed_in?

  #   redirect_to action: :index
  # end
end

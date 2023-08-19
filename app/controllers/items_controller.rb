class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show]
  before_action :set_user,only: [:edit, :update]

  def index
    @item = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
    # @item.attributes = {
    #   item_name: params[:item_name],
    #   info: params[:info],
    #   category_id: params[:category_id],
    #   condition_id: params[:condition_id],
    #   shipping_fee_id: params[:shipping_fee_id],
    #   prefecture_id: params[:prefecture_id],
    #   scheduled_delivery_id: params[:scheduled_delivery_id]
    # }
  end

  def create
    @item = Item.new(item_params)
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

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def update_user
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def show
    #@item = Item.find(params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:item_name, :info, :price, :image, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end




  # def move_to_inde
  #   return if user_signed_in?

  #   redirect_to action: :index
  # end
end

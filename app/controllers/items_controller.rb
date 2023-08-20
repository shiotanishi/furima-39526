class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_user,only: [:edit, :update, :destroy]

  def index
    @item = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
   
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end


  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  

  def show

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
    redirect_to root_path unless current_user == @item.user
  end

  
end

class FurimasController < ApplicationController
  before_action :set_furima, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @furimas = Furima.all
  end

  def new
    @furimas = Furima.new
  end

  def create
    Furima.create(furima_params)
    redirect_to '/'
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    furima = Furima.find(params[:id])
    furima.update(furima_params)
    redirect_to root_path
  end

  def show
  end

  private
  def furima_params
    params.require(:furima).permit(:name, :image, :text)
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end

  

end

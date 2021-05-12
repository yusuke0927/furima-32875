class FurimasController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create, :edit, :update]
   before_action :set_furima, only: [:show, :edit, :update, :destroy]
   before_action :move_to_index, only: [:edit, :update, :destroy]
   
  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path
    else
      render :edit
    end
  end

  def destroy
    @furima.destroy
    redirect_to root_path
  end

  private
  def furima_params
    params.require(:furima).permit(:furima_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @furima.user_id == current_user.id
           redirect_to action: :index
    end
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end
end

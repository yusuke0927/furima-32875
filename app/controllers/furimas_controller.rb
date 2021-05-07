class FurimasController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create]
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

  #def show
    #@furima = Furima.find(params[:id])
  #end

  #def edit
    #@furima = Furima.find(params[:id])
  #end

  #def destroy
    #@furima = Furima.find(params[:id])
    #@furima.destroy
    #redirect_to root_path
  #end

  private
  def furima_params
    params.require(:furima).permit(:furima_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end

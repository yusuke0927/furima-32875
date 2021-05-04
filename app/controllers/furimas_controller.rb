class FurimasController < ApplicationController
   before_action :authenticate_user!, only: [:new]
  def index
    @furimas = Furima.all
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

  private
  def furima_params
    params.require(:furima).permit(:furima_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end

class FurimasController < ApplicationController
   before_action :authenticate_user!, only: [:new]
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
  end

  def create
    Furima.create(furima_params)
  end

  private
  def furima_params
    params.require(:furima).permit(:furima_name, :description, :category, :status, :delivery_charge, :area, :day, :price)
  end
end

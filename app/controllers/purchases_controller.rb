class PurchasesController < ApplicationController
   before_action :authenticate_user!
   before_action :set_furima
   before_action :move_to_index

  def index
    @user_street_address = UserStreetAddress.new
  end

  def create
    @user_street_address = UserStreetAddress.new(user_street_address_params)
    if @user_street_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @furima.price,
        card:   user_street_address_params[:token],
        currency: 'jpy'
      )
       @user_street_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_street_address_params
    params.require(:user_street_address).permit(:price, :postal, :municipality, :address, :building_name, :phone_number, :area_id, :purchase_id).merge(user_id: current_user.id, furima_id: params[:furima_id], token: params[:token])
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def move_to_index
    if @furima.user_id == current_user.id || @furima.purchase.present? 
       redirect_to root_path
    end
  end 

end

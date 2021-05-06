<<<<<<< Updated upstream
#class FurimasController < ApplicationController
 #  before_action :authenticate_user!, only: [:new]
 # def index
  #  @furimas = Furima.all
  #end
=======
class FurimasController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create]
  def index
    # @furimas = Furima.all
    @furimas = Furima.includes(:user).order("created_at DESC")
  end
>>>>>>> Stashed changes

  #def new
    #@furima = Furima.new
  #end

  #def create
    #Furima.create(furima_params)
  #end

<<<<<<< Updated upstream
  #private
  #def furima_params
    #params.require(:furima).permit(:furima_name, :description, :category, :status, :delivery_charge, :area, :day, :price)
  #end
#end
=======
  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
  end

  def destroy
    @furima = Furima.find(params[:id])
    @furima.destroy
    redirect_to root_path
  end


  private
  def furima_params
    params.require(:furima).permit(:furima_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
>>>>>>> Stashed changes

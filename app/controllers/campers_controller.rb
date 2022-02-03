class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def new
    @user = User.find(params[:user_id])
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @user = User.find(params[:user_id])
    @camper.user = @user
    if @camper.save
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  def show
    @camper = Camper.find(params[:id])
  end

  private

  def camper_params
    params.require(:camper).permit(:model, :price, :description, :availability, :photo_url)
  end
end

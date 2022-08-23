class CaravansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @caravans = Caravan.all
  end

  def show
    @caravan = Caravan.find(params[:id])
  end

  def new
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(caravan_params)
    if @caravan.save
      redirect_to caravan_path(@caravan)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @caravan = Caravan.find(params[:id])
  end

  def update
    @caravan = Caravan.find(params[:id])
    @caravan.update(caravan_params)
    redirect_to caravans_path
  end

  def destroy
    @caravan = Caravan.find(params[:id])
    @caravan.destroy
    redirect_to caravans_path
  end

  private

  def caravan_params
    params.require(:caravan).permit(:model, :location, :price, :capacity, :year, :fuelType, :picture_url, :description, photos: [])
  end
end

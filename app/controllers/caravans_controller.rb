class CaravansController < ApplicationController

  def index
    @caravans = Caravan.all
  end

  def new
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(carvan_params)
    @caravan.save
    redirect_to caravans_path
  end

  def show
    @caravan = Caravan.find(params[:id])
  end

  def update
    @caravan =  Caravan.find(params[:id])
    @caravan.update(caravan_params)
    redirect_to caravans_path
  end

  def edit
    @caravan =  Caravan.find(params[:id])
  end

  def destroy
    @caravan = Caravan.find(params[:id])
    @caravan.destroy
    redirect_to caravans_path
  end

  private

  def caravan_params
    params.require(:caravan).permit(:name, :photo)
  end

end

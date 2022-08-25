class CaravansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @caravans = Caravan.all
    if params[:query].present?
      @caravans = Caravan.search_by_model_and_location(params[:query])
    else
      @caravans = Caravan.all
    end
    @markers = @caravans.map do |caravan|
      {
        lat: caravan.latitude,
        lng: caravan.longitude,
        info_window: render_to_string(partial: "info_window", locals: {caravan: caravan}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def show
    @caravan = Caravan.find(params[:id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.caravan = @caravan
  end

  def new
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(caravan_params)
    @caravan.user = current_user
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
    redirect_to user_listings_path
  end

  def user_listings
    @caravans = Caravan.where(user: current_user)
  end

  private

  def caravan_params
    params.require(:caravan).permit(:model, :location, :price, :capacity, :year, :fuelType, :picture_url, :description, photos: [])
  end
end

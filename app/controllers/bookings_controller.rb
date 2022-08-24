class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.caravan = Caravan.find(params[:caravan_id])
    @booking.user = current_user
    if @booking.save
      redirect_to caravans_path
    else
      raise
      render 'caravans/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

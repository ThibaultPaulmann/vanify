class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.caravan = Caravan.find(params[:caravan_id])
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'caravans/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

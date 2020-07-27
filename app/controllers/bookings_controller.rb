class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passenger = Passenger.new
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render new_booking_path
    end   
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :num_passengers,
      passengers_attributes: [:id, :name, :email])
  end

end

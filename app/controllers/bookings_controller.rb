class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_selection])
    @booking = Booking.new
    @passenger = Passenger.new
    params[:num_passengers].to_i.times { |t| @booking.passengers.build }
  end

end

class PassengerMailer < ApplicationMailer

  def thank_you
    @booking, @passenger = params[:booking], params[:passenger]
    @flight = @booking.flight
    mail(to: @passenger.email, subject: 'Thank you for booking at Odin Flights')
  end
end

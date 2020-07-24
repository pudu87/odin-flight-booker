class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airports_array = Airport.all.map { |airport| [airport.location, airport.id] }
    @months_array = Flight.all.map { |flight| flight.departure.month }.uniq.sort
    @days_array = Flight.all.map { |flight| flight.departure.day }.uniq.sort
  end

  def new
  end

end

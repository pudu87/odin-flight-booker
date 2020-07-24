class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airports_array = Airport.all.map { |airport| [airport.location, airport.id] }
    @months_array = Flight.all.map { |flight| flight.departure.month }.uniq.sort
    @days_array = Flight.all.map { |flight| flight.departure.day }.uniq.sort

    @available_flights = @flights.where(from_airport_id: params[:from_airport_id])
                                 .where(to_airport_id: params[:to_airport_id])
                                 .search_by_month(params[:month])
                                 .search_by_day(params[:day])
  end

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


airport_list = [
  [ 'SFO', 'San Francisco' ],
  [ 'JFK', 'New York' ],
  [ 'FAE', 'Vágar' ],
  [ 'CPH', 'Copenhagen' ],
  [ 'BRU', 'Brussels' ],
  [ 'AMS', 'Amsterdam' ],
  [ 'SCL', 'Santiago' ],
  [ 'EZE', 'Buenos Aires' ],
  [ 'HKG', 'Hong Kong' ],
  [ 'CDG', 'Paris' ],
  [ 'IAH', 'Houston' ],
  [ 'RKV', 'Reykjavik' ],
  [ 'LHR', 'London' ]
]

flight_list = [
  [ 'SFO', 'JFK', "04:55" ],
  [ 'SFO', 'HKG', "14:05" ],
  [ 'SFO', 'IAH', "03:15" ],
  [ 'JFK', 'AMS', "07:15" ],
  [ 'JFK', 'CDG', "07:30" ],
  [ 'JFK', 'LHR', "07:05" ],
  [ 'FAE', 'CPH', "02:05" ],
  [ 'CPH', 'BRU', "01:30" ],
  [ 'CPH', 'RKV', "03:15" ],
  [ 'CPH', 'LHR', "02:00" ],
  [ 'BRU', 'HKG', "11:10" ],
  [ 'BRU', 'RKV', "03:15" ],
  [ 'AMS', 'EZE', "13:55" ],
  [ 'SCL', 'EZE', "02:00" ],
  [ 'SCL', 'IAH', "09:50" ],
  [ 'EZE', 'CDG', "13:10" ],
  [ 'HKG', 'LHR', "11:55" ],
  [ 'RKV', 'LHR', "03:05" ],
# busy flight-routes
  [ 'SFO', 'JFK', "04:55" ],
  [ 'SFO', 'IAH', "03:15" ],
  [ 'JFK', 'CDG', "07:30" ],
  [ 'JFK', 'LHR', "07:05" ],
  [ 'JFK', 'LHR', "07:05" ],
  [ 'CPH', 'RKV', "03:15" ],
  [ 'SCL', 'EZE', "02:00" ],
  [ 'HKG', 'LHR', "11:55" ]
]

def rand_hour
  hour = 4 + rand(16)
  hour = "0#{hour}" if hour < 10
  hour
end

airport_list.each do |code, location|
  Airport.create(code: code, location: location)
end

9.times do |t|
  flight_list.each do |from_airport, to_airport, duration|
    hour = rand_hour
    Flight.create(
      from_airport_id: Airport.find_by_code(from_airport).id,
      to_airport_id: Airport.find_by_code(to_airport).id,
      duration: duration,
      departure: "2020-09-0#{t+1} #{hour}:#{rand(6)}0:00"
    )
  end
end

9.times do |t|
  flight_list.each do |to_airport, from_airport, duration|
    hour = rand_hour
    Flight.create(
      from_airport_id: Airport.find_by_code(from_airport).id,
      to_airport_id: Airport.find_by_code(to_airport).id,
      duration: duration,
      departure: "2020-09-0#{t+1} #{hour}:#{rand(6)}0:00"
    )
  end
end
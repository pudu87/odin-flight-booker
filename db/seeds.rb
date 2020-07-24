# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# construction of airports-table

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

airport_list.each do |code, location|
  Airport.create(code: code, location: location)
end


# construstion of flights-table

flight_list = [
  [ 'SFO', 'JFK', "04:55", 2 ],
  [ 'SFO', 'HKG', "14:05", 1 ],
  [ 'SFO', 'IAH', "03:15", 2 ],
  [ 'JFK', 'AMS', "07:15", 1 ],
  [ 'JFK', 'CDG', "07:30", 2 ],
  [ 'JFK', 'LHR', "07:05", 2 ],
  [ 'FAE', 'CPH', "02:05", 1 ],
  [ 'CPH', 'BRU', "01:30", 1 ],
  [ 'CPH', 'RKV', "03:15", 1 ],
  [ 'CPH', 'LHR', "02:00", 1 ],
  [ 'BRU', 'HKG', "11:10", 0 ],
  [ 'BRU', 'RKV', "03:15", 0 ],
  [ 'AMS', 'EZE', "13:55", 1 ],
  [ 'SCL', 'EZE', "02:00", 2 ],
  [ 'SCL', 'IAH', "09:50", 1 ],
  [ 'EZE', 'CDG', "13:10", 1 ],
  [ 'HKG', 'LHR', "11:55", 2 ],
  [ 'RKV', 'LHR', "03:05", 1 ],
]

def rand_hour
  hour = 4 + rand(16)
  hour = "0#{hour}" if hour < 10
  hour
end

def create_flights(flight_list, t, frequency)
  flight_list.each do |from_airport, to_airport, duration, f|
    if frequency == f
      hour = rand_hour
      Flight.create(
        from_airport_id: Airport.find_by_code(from_airport).id,
        to_airport_id: Airport.find_by_code(to_airport).id,
        duration: duration,
        departure: "2020-09-0#{t+1} #{hour}:#{rand(6)}0:00"
      )
      Flight.create(
          to_airport_id: Airport.find_by_code(from_airport).id,
          from_airport_id: Airport.find_by_code(to_airport).id,
          duration: duration,
          departure: "2020-09-0#{t+1} #{hour}:#{rand(6)}0:00"
        )
    end
  end
end

# weekly routes
frequency = 0
3.times do |t|
  t = (t + 1) * 3
  create_flights(flight_list, t, frequency)
end

# daily routes
frequency = 1
9.times do |t|
  create_flights(flight_list, t, frequency)  
end

# busy routes
frequency = 2
9.times do |t|
  3.times do
    create_flights(flight_list, t, frequency) 
  end
end
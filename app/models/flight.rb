class Flight < ApplicationRecord

  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport,   class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  scope :search_by_month, ->(m) { where("cast(strftime('%m', departure) as int) = ?", m) }
  scope :search_by_day,   ->(d) { where("cast(strftime('%d', departure) as int) = ?", d) }

  def duration=(time)
    if time.is_a?(String) && time.match(/[0-2]\d:[0-6]\d/)
      time = time[0..1].to_i*3600 + time[3..4].to_i*60
    end
    write_attribute(:duration, time)
  end

  def departure_formatted
    departure.strftime("%m/%d")
  end

end

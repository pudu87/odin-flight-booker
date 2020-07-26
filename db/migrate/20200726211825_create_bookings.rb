class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|

      t.integer :num_passengers
      t.belongs_to :flight

      t.timestamps

    end
  end
end

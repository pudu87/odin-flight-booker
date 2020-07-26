class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|

      t.belongs_to :from_airport, foreign_key: { to_table: 'airports' }
      t.belongs_to :to_airport, foreign_key: { to_table: 'airports' }
      t.datetime :departure
      t.integer :duration

      t.timestamps

    end
  end
end

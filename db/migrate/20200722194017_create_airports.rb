class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|

      t.timestamps

      t.string :code
      t.string :location

    end
  end
end

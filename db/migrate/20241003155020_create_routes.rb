class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :departure_airport
      t.string :destination_airport
      t.json :weather_data

      t.timestamps
    end
  end
end

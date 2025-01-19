class CreateAircrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :aircrafts do |t|
      t.string :registration
      t.string :make_model
      t.float :max_speed
      t.float :cruise_speed
      t.float :fuel_capacity
      t.float :empty_weight
      t.float :max_takeoff_weight

      t.timestamps
    end
  end
end

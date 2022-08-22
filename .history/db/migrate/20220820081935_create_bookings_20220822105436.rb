class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime 
      t.datetime :time
      t.string :origin
      t.string :destination
      t.integer :distance
      t.integer :cost
      t.string  :houseSize
      t.integer :user_id, null: false, foreign_key: true
      t.integer :mover_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.date
      t.string :origin
      t.string :destination
      t.integer :distance
      t.integer :cost
      t.string  :houseSize
      t.references :user_id, null: false, foreign_key: true
      t.references :mover_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
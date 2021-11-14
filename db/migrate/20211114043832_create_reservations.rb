class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :desired_date
      t.time :desired_time
      t.string :special_request
      t.integer :tour_id
      t.integer :user_id

      t.timestamps
    end
  end
end

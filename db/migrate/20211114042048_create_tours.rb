class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.time :duration
      t.string :location
      t.string :image
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end

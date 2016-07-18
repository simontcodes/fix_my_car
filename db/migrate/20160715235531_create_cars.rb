class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.date :year
      t.string :color
      t.string :plate
      t.integer :client_id

      t.timestamps
    end
  end
end

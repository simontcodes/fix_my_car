class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.boolean :approved
      t.integer :job_id

      t.timestamps
    end
  end
end

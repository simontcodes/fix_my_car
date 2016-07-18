class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.text :message
      t.integer :job_id

      t.timestamps
    end
  end
end

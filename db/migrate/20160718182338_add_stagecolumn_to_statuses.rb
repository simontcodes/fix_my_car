class AddStagecolumnToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :stage, :integer
  end
end

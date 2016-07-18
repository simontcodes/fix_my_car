class RemoveStageFromStatuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :stage, :integer
  end
end

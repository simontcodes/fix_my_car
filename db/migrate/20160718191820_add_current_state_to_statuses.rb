class AddCurrentStateToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :current_state, :string
  end
end

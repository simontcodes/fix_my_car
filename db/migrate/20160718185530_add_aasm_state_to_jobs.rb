class AddAasmStateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :aasm_state, :string
  end
end

class AddBudgetToCosts < ActiveRecord::Migration[5.0]
  def change
    add_column :costs, :budget, :string
  end
end

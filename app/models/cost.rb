class Cost < ApplicationRecord
  belongs_to :job

  mount_uploader :budget, BudgetUploader
end

class Cost < ApplicationRecord
  belongs_to :job
  mount_uploader :budget, BudgetUploader

  before_save :update_status_through_cost

    def update_status_through_cost
      status = Status.new
      status.job_id = self.job_id
      status.message = 'Estimate Uploaded'
      status.current_state = 'diagnosing'
      status.save
    end



end

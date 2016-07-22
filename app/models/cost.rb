class Cost < ApplicationRecord
  belongs_to :job
  mount_uploader :budget, BudgetUploader

  # before_save :update_status_through_cost
  #
  #   def update_status_through_cost
  #     status = Status.new
  #     status.update_status_and_job
  #   end

    # def update_status_and_job
    #   Status.current_state = Status.job.aasm_state
    #     if Status.job.budgeted?
    #       Status.job.approve!
    #     end
  
end

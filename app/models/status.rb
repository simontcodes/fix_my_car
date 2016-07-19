class Status < ApplicationRecord
  belongs_to :job

  before_save :update_status_and_job
 
  def update_status_and_job
    self.current_state = self.job.aasm_state
    if self.job.received?
      self.job.diagnose!
    elsif self.job.diagnosed?
      self.job.budget!
    elsif self.job.budgeted?
      self.job.approve!
    elsif self.job.approved?
      self.job.repair!
    elsif self.job.repairing?
      self.job.complete!
    end
  end


end

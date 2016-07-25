class Status < ApplicationRecord
  belongs_to :job

  before_save :update_status_and_job

  def update_status_and_job
    self.current_state = self.job.aasm_state
    if self.job.received?
      self.job.diagnose!
    elsif self.job.diagnosing?
      self.job.budget!
    elsif self.job.budgeting?
      self.job.approve!
    elsif self.job.waiting_for_approval?
      self.job.repair!
    elsif self.job.repairing?
      self.job.complete!
      ClientMailer.finished(self.job.car.client).deliver_later
    end
  end


end

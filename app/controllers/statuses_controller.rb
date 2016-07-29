class StatusesController < ApplicationController
  skip_before_action :require_login, only: [:create]

   def new
     @status = Status.new
   end

def create
  @status = Status.new(status_params)

  if @status.save
    redirect_to job_path(@status.job.token)
  else
    render :new
  end
end

private

  def status_params
    params.require(:status).permit(:message, :job_id, cost_attributes: [:budget, :job_id, :approved])
  end
end

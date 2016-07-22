class StatusesController < ApplicationController

   def new
     @status = Status.new
   end

def create
  @status = Status.new(status_params)

  if @status.save
    redirect_to job_path(@status.job_id)
  else
    render :new
  end
end

private

  def status_params
    params.require(:status).permit(:message, :job_id)
  end
end

class CostsController < ApplicationController
  skip_before_action :require_login, only: [:show]
  def new
    @cost = Status.new
  end

  def show
    uploader = Cost.find(params[:id]).budget

    send_file(uploader.file.file)
  end

def create

 @cost = Cost.new(cost_params)

 if @cost.save
   redirect_to job_path(@cost.job.token)
 else
   render :new
 end
end

private

 def cost_params
   params.require(:cost).permit(:budget, :job_id, :approved)
 end
end

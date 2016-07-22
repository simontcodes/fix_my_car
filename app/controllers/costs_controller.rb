class CostsController < ApplicationController
  def new
    @cost = Status.new
  end

def create
 @cost = Cost.new(cost_params)

 if @cost.save
   redirect_to job_path(@cost.job_id)
 else
   render :new
 end
end

private

 def cost_params
   params.require(:cost).permit(:budget, :job_id, :approved)
 end
end

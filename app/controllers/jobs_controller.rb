class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])

  end

  def new
    @job = Job.new
    @params = params

    #@clients = Client.all
    # @job.cars.build
    # @job.mechanics.build

  end

  def create
    @job = Job.new(job_params)
    @params = params

    if @job.save
      redirect_to dashboards_path, notice: "Client Created Successfully!"
    else
      render :new
    end

  end

  private

  def job_params
    params.require(:job).permit(:car_id, :mechanic_id)
  end



end

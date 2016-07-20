class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])

  end

  def new
    @job = Job.new
    #@clients = Client.all
    # @job.cars.build
    # @job.mechanics.build

  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to dashboards_path, notice: "Client Created Successfully!"
    else
      render :new
    end

  end

  private

  def job_params
    params.permit(mechanic_attributes: [:name], cars_attributes: [:model])
  end



end

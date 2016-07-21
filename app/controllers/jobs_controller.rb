class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @status = Status.new
    @statuses = Status.all
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
      ClientMailer.received(@job.car.client).deliver_later
      redirect_to dashboards_path, notice: "Client Created Successfully!"
    else
      render :new
    end
  end

# def update
#   @status = Status.new(status_params)
#
#   if @status.save
#     redirect_to job_path(@job.id)
#   else
#     render :new
#   end
end
  private

  def job_params
    params.require(:job).permit(:car_id, :mechanic_id)
  end

  # def status_params
  #   params.require(:status).permit(:message)
  # end

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

  end

  def create
    @job = Job.new(job_params)

    if @job.save
      # ClientMailer.received(@job.car.client).deliver_later
      send_message("+14168858365","hihihi")
      redirect_to dashboards_path, notice: "Job Created Successfully!"
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

  def send_message(phone_number, alert_message)
    #test account_sid = "AC5bb068e864539b01f20f046a8635c262"
    #test auth_token = "189c79a9541f497d17192574166f5c53"
    account_sid = Rails.application.secrets.twilio_key
    auth_token = Rails.application.secrets.twilio_auth

       twilio_number = "+16474964559"
       client = Twilio::REST::Client.new account_sid, auth_token

       message = client.account.messages.create(
         :from => twilio_number,
         :to => phone_number,
         :body => alert_message,
         # US phone numbers can make use of an image as well.
         # :media_url => image_url
       )
       puts message.to
   end

  # def status_params
  #   params.require(:status).permit(:message)
  # end

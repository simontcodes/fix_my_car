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
      ClientMailer.aproval(self.job.car.client, self.job).deliver_later
      send_message("+14162007371","Thank you for choosing FixMyCar, a cost estimate has been uploaded go to the link to download it.
      #{job_url(id: @job.token)}")
    elsif self.job.waiting_for_approval?
      self.job.repair!
    elsif self.job.repairing?
      self.job.complete!
      ClientMailer.finished(self.job.car.client).deliver_later
    end
  end

  def send_message(phone_number, alert_message)
  # account_sid = "AC5bb068e864539b01f20f046a8635c262"
    #test auth_token = "189c79a9541f497d17192574166f5c53"
    # account_sid = Rails.application.secrets.twilio_key
    # auth_token = Rails.application.secrets.twilio_auth

    account_sid = ENV['TWILIO_KEY']
    auth_token = ENV['TWILIO_AUTH']

      # binding.pry
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

end

class Job < ApplicationRecord
  include AASM

  before_create :generate_token
  #after_save :send_message

  has_many :statuses
  accepts_nested_attributes_for :statuses
  has_one :cost
  accepts_nested_attributes_for :cost
  belongs_to :mechanic
  belongs_to :car

  validates :car_id, :mechanic_id, presence: true, on: :create


  aasm do
    state :received, initial: true
    state :diagnosing
    state :budgeting
    state :waiting_for_approval
    state :repairing
    state :completed


    event :diagnose do
      transitions from: :received, to: :diagnosing
    end

    event :budget do
      transitions from: :diagnosing, to: :budgeting
    end

    event :approve do
      transitions from: :budgeting, to: :waiting_for_approval
      ClientMailer.aproval(@job.car.client, @job).deliver_later
    end

    event :repair do
      transitions from: :waiting_for_approval, to: :repairing
    end

    event :complete do
      transitions from: :repairing, to: :completed
    end

  end

  def send_message()
    #test account_sid = "AC5bb068e864539b01f20f046a8635c262"
    #test auth_token = "189c79a9541f497d17192574166f5c53"
    account_sid = Rails.application.secrets.twilio_key
    auth_token = Rails.application.secrets.twilio_auth

       twilio_number = "+16474964559"
       client = Twilio::REST::Client.new account_sid, auth_token

        # response = client.outgoing_caller_ids.create(
        # phone_number: "+14168858365"
        #   )
        #   puts response.validation_code
       message = client.account.messages.create(
         :from => twilio_number,
         :to => "+14168858365",
         :body => "test",
        #car.client.phone
       )
       puts message.to
   end

   def generate_token
     digest = Digest::SHA256.new
     self.token = digest.update("#{SecureRandom.uuid}").to_s
   end



#Twilio Stuff


end

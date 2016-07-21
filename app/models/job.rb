class Job < ApplicationRecord
  include AASM

  after_save :send_message

  has_many :statuses
  accepts_nested_attributes_for :statuses
  has_one :cost
  belongs_to :mechanic
  belongs_to :car

  aasm do
    state :received, initial: true
    state :diagnosed
    state :budgeted
    state :approved
    state :repairing
    state :completed


    event :diagnose do
      transitions from: :received, to: :diagnosed
    end

    event :budget do
      transitions from: :diagnosed, to: :budgeted
    end

    event :approve do
      transitions from: :budgeted, to: :approved
    end

    event :repair do
      transitions from: :approved, to: :repairing
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

       message = client.account.messages.create(
         :from => twilio_number,
         :to => "+14168858365",
         :body => "test",
        #car.client.phone
       )
       puts message.to
   end


#Twilio Stuff


end

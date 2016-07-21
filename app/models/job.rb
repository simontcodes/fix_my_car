class Job < ApplicationRecord
  include AASM

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

#Twilio Stuff


end

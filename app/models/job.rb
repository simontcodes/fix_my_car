class Job < ApplicationRecord
  has_many :status
  has_one :cost
  belongs_to :mechanic
  belongs_to :car
end

class Car < ApplicationRecord
  has_many :jobs
  belongs_to :client, optional: true
end

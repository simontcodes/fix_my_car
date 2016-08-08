class Car < ApplicationRecord
  has_many :jobs
  belongs_to :client, optional: true

  validates :make, :model, :color, :year, :plate, presence: true
  validates :plate, uniqueness: true


end

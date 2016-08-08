class Client < ApplicationRecord
  has_many :cars
  accepts_nested_attributes_for :cars


  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end

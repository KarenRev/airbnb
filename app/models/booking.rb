class Booking < ApplicationRecord
  belongs_to :offer, dependent: :destroy
  belongs_to :user
  validates :status, presence: true
  validates :date, uniqueness: true, presence: true
end

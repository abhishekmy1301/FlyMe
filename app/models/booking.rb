class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :aircraft

  validates :departure_time, presence: true
  validates :takeoff, presence: true, uniqueness: { scope: :landing, message: "Takeoff and Landing can't be the same" }
  validates :landing, presence: true
end

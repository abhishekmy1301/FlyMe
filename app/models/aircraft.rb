class Aircraft < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :model, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 100 }
  validates :description, presence: true, length: { minimum: 10 }
end

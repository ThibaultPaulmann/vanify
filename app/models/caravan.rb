class Caravan < ApplicationRecord
  FUEL_TYPES = ["diesel", "petrol", "electricity"]

  belongs_to :user, dependent: :destroy

  validates :model, presence: true, length { minimum: 3 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fuelType, inclusion: { in: FUEL_TYPES }
end

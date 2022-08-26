class Caravan < ApplicationRecord
  FUEL_TYPES = ["diesel", "petrol", "electricity"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  geocoded_by :location
  after_validation :geocode

  validates :model, presence: true, length: { minimum: 3 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fuelType, presence: true, inclusion: { in: FUEL_TYPES }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
  
  include PgSearch::Model

  pg_search_scope :search_by_model_and_location,
    against: [ :model, :location ],
    associated_against: {
    user: [ :username, :email ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

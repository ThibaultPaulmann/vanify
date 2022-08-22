class Booking < ApplicationRecord
  belongs_to :caravan
  belongs_to :renter
end

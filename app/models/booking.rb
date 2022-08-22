class Booking < ApplicationRecord
  belongs_to :caravan, dependent: :destroy
  belongs_to :user, dependent: :destroy
end

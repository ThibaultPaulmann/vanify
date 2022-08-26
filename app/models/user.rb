class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
  has_many :bookings, dependent: :destroy
  has_many :caravans, dependent: :destroy
end

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :memberships
  has_many :ladders, through: :memberships
  has_many :bookings
  has_many :games_as_player1, class_name: 'Game', foreign_key: 'player1_id'
  has_many :games_as_player2, class_name: 'Game', foreign_key: 'player2_id'
end

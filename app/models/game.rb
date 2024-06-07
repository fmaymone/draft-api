class Game < ApplicationRecord
  belongs_to :ladder
  belongs_to :venue
end

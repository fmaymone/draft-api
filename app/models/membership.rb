class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :ladder
end

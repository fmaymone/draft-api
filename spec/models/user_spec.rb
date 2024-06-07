# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:memberships) }
  it { should have_many(:ladders).through(:memberships) }
  it { should have_many(:bookings) }
  it { should have_many(:games_as_player1).class_name('Game').with_foreign_key('player1_id') }
  it { should have_many(:games_as_player2).class_name('Game').with_foreign_key('player2_id') }
end

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :game, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :datetime
      t.string :status

      t.timestamps
    end
  end
end

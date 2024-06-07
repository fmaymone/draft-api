class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :ladder, foreign_key: true
      t.references :venue, foreign_key: true
      t.datetime :datetime
      t.integer :player1_id, foreign_key: { to_table: :users }
      t.integer :player2_id, foreign_key: { to_table: :users }
      t.string :score

      t.timestamps
    end

    add_foreign_key :games, :users, column: :player1_id
    add_foreign_key :games, :users, column: :player2_id
  end
end

class CreateLadders < ActiveRecord::Migration[7.1]
  def change
    create_table :ladders do |t|
      t.string :name
      t.references :sport, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end

class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ladder, null: false, foreign_key: true
      t.datetime :join_date

      t.timestamps
    end
  end
end

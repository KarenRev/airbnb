class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.boolean :accepted
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class ChangeBooleanToString < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :accepted, :boolean
    add_column :bookings, :status, :string
  end
end

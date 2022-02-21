class AddNameToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :name, :string
  end
end

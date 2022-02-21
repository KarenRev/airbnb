class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :role
      t.string :instagram_link
      t.string :youtube_link
      t.string :spotify_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

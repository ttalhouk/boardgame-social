class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :bgg_link
      t.integer :bgg_id

      t.timestamps
    end
  end
end

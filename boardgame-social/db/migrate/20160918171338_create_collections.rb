class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :owner
      t.integer :game_id

      t.timestamps
    end
  end
end

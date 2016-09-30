class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :user_id
      t.integer :borrower_id
      t.integer :game_id
      t.string  :status, default: "requested"

      t.timestamps
    end
  end
end

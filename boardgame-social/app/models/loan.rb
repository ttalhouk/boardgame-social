class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :borrower, class_name: "User"
  belongs_to :game

  validates :game_id, uniqueness: { scope: :user_id,
    message: "already loaned." }
end

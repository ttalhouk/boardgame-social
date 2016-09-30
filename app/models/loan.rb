class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :borrower, class_name: "User"
  belongs_to :game

  validates :game_id, uniqueness: {
    scope:  :user_id,
    conditions: -> { where(status: 'confirmed') },
    message: "already loaned."
  }
  validates :game_id, uniqueness: {
    scope:  [:user_id, :borrower_id],
    message: "already requested and/or borrowed."
  }
end

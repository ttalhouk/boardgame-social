class Collection < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :game

  validates :game_id, uniqueness: { scope: :owner_id,
    message: "Already own this game" }
end

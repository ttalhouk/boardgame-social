class Game < ApplicationRecord
  has_many :collections
  has_many :owners, through: :collections

  validates :name, :description, presence: true
end

class Game < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :owners, through: :collections
  has_many :loans

  validates :name, :description, presence: true
  validates :bgg_id, uniqueness: true
end

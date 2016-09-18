class Game < ApplicationRecord
  has_many :collections
  has_many :owners, through: :collections
end

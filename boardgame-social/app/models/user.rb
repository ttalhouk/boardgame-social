class User < ApplicationRecord
  has_many :collections, foreign_key: :owner_id, dependent: :destroy
  has_many :games, through: :collections

  validates :bgg_username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class User < ApplicationRecord
  has_many :collections, foreign_key: :owner_id, dependent: :destroy
  has_many :games, through: :collections

  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", dependent: :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :loans, dependent: :destroy
  has_many :borrowers, through: :loans
  has_many :borrowed_games, through: :loans, foreign_key: :game_id, source: :borrower
  has_many :loaned_games, through: :loans, foreign_key: :game_id, source: :user
  has_many :lenders, through: :loans, foreign_key: :user_id, source: :borrower

  validates :bgg_username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

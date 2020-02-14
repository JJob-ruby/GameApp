class Match < ApplicationRecord

  belongs_to :game

  has_many :match_users
  has_many :users, through: :match_users

end

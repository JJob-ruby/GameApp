class MatchUser < ApplicationRecord

  belongs_to :match
  belongs_to :user

	has_many :scores

end

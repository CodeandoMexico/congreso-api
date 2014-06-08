class Deputy < ActiveRecord::Base
  has_many :votes
  has_many :initiatives, through: :votes
end

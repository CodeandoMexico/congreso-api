class Vote < ActiveRecord::Base
  belongs_to :initiative
  belongs_to :deputy

  def self.initiatives_votes(initiatives)
    votes = initiatives.map(&:votes)
    votes = votes.flatten
    votes = Vote.where("id IN (#{votes.map(&:id).join(',')})")
    votes
  end
end

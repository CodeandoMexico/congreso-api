class Deputy < ActiveRecord::Base
  has_many :votes
  has_many :initiatives, through: :votes

  attr_accessor :vote_count

  def self.top(vote_type, initiative, order = nil, limit = nil)
    order ||= 'DESC'
    limit ||= 25

    initiatives = initiative.includes(:votes)

    votes = initiatives.map { |i| i.votes }
    votes = votes.flatten
    votes = Vote.where("id IN (#{votes.map(&:id).join(',')})")

    deputies = votes.where("vote_type = '#{vote_type}'").group(:deputy_id).count('vote_type')
    deputies = deputies.sort_by(&:last)
    deputies = deputies.reverse if order == 'DESC'

    a = Deputy.find(deputies.first(limit.to_i).to_h.keys)
    a.map { |d| d.vote_count = deputies.to_h[d.id] }
    a
  end
end

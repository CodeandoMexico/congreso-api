class Deputy < ActiveRecord::Base
  has_many :votes
  has_many :initiatives, through: :votes

  attr_accessor :vote_count

  def self.top(vote_type, initiative, params)
    params[:order] ||= 'DESC'
    params[:limit] ||= 25
    params[:order].upcase!

    initiatives = initiative.includes(:votes)

    votes = Vote.initiatives_votes(initiatives)

    deputies = votes.where("vote_type = '#{vote_type}'").group(:deputy_id).count('vote_type')
    deputies = deputies.sort_by(&:last)
    deputies = deputies.reverse if params[:order] == 'DESC'

    a = Deputy.find(deputies.first(params[:limit].to_i).to_h.keys)
    a.map { |d| d.vote_count = deputies.to_h[d.id] }
    a = a.sort_by(&:vote_count)

    return a.reverse if params[:order] == 'DESC'
    a
  end
end

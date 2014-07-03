class Deputy < ActiveRecord::Base
  has_many :votes
  has_many :initiatives, through: :votes

  def self.top(vote_type = '', period = '', year='', legislature = '', order = 'DESC', limit = 25)
    initiatives = Initiative.where("period = '#{period}'").where("year = '#{year}'").where("legislature = '#{legislature}'").includes(:votes)

    votes = initiatives.map { |i| i.votes }
    votes = votes.flatten
    votes = Vote.where("id IN (#{votes.map(&:id).join(',')})")

    deputies = votes.where("vote_type = '#{vote_type}'").group(:deputy_id).count('vote_type')
    deputies = deputies.sort_by(&:last)
    deputies = deputies.reverse if order == 'DESC'

    Deputy.find(deputies.first(limit.to_i).to_h.keys)
  end

end

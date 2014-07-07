class Initiative < ActiveRecord::Base
  has_many :votes

  scope :periodo, -> (period) { where period: period }
  scope :ano, -> (year) { where year: year }
  scope :legislatura, -> (legislature) { where legislature: legislature }
end

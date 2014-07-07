class Initiative < ActiveRecord::Base
  has_many :votes

  scope :period, -> (period) { where period: period }
  scope :year, -> (year) { where year: year }
  scope :legislature, -> (legislature) { where legislature: legislature }
end

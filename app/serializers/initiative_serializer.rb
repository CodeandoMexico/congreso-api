class InitiativeSerializer < ActiveModel::Serializer
  cached
  attributes :id, :decree, :date, :period, :year, :legislature
end

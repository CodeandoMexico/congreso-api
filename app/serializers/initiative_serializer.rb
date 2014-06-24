class InitiativeSerializer < ActiveModel::Serializer
  attributes :id, :decree, :date, :period, :year, :legislature
end

class InitiativeSerializer < ActiveModel::Serializer
  attributes :id, :decree, :date, :period, :year, :legislature, :cantidad_votos

  def cantidad_votos
    object.votes.count
  end
end

class DeputyTopSerializer < ActiveModel::Serializer
  cached
  attributes :id, :name, :party, :vote_count
end

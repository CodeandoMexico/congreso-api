class DeputySerializer < ActiveModel::Serializer
  cached
  attributes :id, :name, :party
end

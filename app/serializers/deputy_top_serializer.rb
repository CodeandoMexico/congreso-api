class DeputyTopSerializer < ActiveModel::Serializer
  cached
  attributes :id, :name, :party, :vote_count

  # def count
  #   @object.votes.where("vote_type = '#{options[:tipo_voto]}'").count
  # end
end

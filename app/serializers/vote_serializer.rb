class VoteSerializer < ActiveModel::Serializer
  cached
  attributes :id, :deputy_id, :initiative_id, :vote_type
end

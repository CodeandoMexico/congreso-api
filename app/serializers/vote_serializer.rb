class VoteSerializer < ActiveModel::Serializer
  attributes :id, :deputy_id, :initiative_id, :type
end

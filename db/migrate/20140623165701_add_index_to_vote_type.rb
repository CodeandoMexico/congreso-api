class AddIndexToVoteType < ActiveRecord::Migration
  def change
    add_index :votes, :vote_type
  end
end

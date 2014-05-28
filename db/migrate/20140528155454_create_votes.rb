class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :deputy_id
      t.integer :initiative_id
      t.string :type

      t.timestamps
    end
  end
end

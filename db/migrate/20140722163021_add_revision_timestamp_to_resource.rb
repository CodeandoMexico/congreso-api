class AddRevisionTimestampToResource < ActiveRecord::Migration
  def change
    add_column :resources, :revision_timestamp, :string
  end
end

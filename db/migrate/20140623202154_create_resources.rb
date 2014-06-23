class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :guid

      t.timestamps
    end
    add_index :resources, :guid
  end
end

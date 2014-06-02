class CreateDeputies < ActiveRecord::Migration
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :party

      t.timestamps
    end
  end
end

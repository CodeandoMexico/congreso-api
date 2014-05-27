class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :decree
      t.date :date
      t.string :period
      t.string :year
      t.string :legislature

      t.timestamps
    end
  end
end

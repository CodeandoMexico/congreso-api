class ChangeColumnTypeDecree < ActiveRecord::Migration
  def up
    change_column :initiatives, :decree, :text
  end

  def down
    change_column :initiatives, :decree, :string
  end
end

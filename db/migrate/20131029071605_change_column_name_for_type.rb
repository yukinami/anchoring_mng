class ChangeColumnNameForType < ActiveRecord::Migration
  def up
    rename_column :anchorings, :type, :category
  end

  def down
    rename_column :anchorings, :category, :type
  end
end

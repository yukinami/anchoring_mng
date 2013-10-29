class ChangeDataTypeForGtNt < ActiveRecord::Migration
  def up
    change_table :anchorings do |t|
      t.change :gt, :string
      t.change :nt, :string
    end
  end

  def down
    change_table :anchorings do |t|
      t.change :gt, :integer
      t.change :nt, :integer
    end
  end
end

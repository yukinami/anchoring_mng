class ChangeDataTypeForPower < ActiveRecord::Migration
  def up
    change_table :anchorings do |t|
      t.change :power, :string
    end
  end

  def down
    change_table :anchorings do |t|
      t.change :power, :integer
    end
  end
end

class ChangeDataTypeForAnchorDateSailDate < ActiveRecord::Migration
  def up
    change_table :anchorings do |t|
      t.change :anchor_date, :datetime
      t.change :sail_date, :datetime
    end
  end

  def down
    change_table :anchorings do |t|
      t.change :anchor_date, :date
      t.change :sail_date, :date
    end
  end
end

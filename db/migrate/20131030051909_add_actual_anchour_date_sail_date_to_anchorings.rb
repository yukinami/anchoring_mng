class AddActualAnchourDateSailDateToAnchorings < ActiveRecord::Migration
  def change
    change_table :anchorings do |t|
      t.column :actual_anchor_date, :datetime
      t.column :actual_sail_date, :datetime
    end
  end
end

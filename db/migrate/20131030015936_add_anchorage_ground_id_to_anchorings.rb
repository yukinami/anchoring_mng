class AddAnchorageGroundIdToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :anchorage_ground_id, :integer
  end
end

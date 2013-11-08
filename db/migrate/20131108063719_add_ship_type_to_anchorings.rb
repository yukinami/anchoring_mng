class AddShipTypeToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :ship_type, :string
  end
end

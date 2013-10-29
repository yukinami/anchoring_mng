class AddStatusToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :status, :string
  end
end

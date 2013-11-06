class AddAttnToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :confirm_attn_id, :integer
    add_column :anchorings, :anchor_attn_id, :integer
    add_column :anchorings, :sail_attn_id, :integer
  end
end

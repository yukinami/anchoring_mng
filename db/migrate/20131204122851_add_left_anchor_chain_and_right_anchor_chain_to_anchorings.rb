class AddLeftAnchorChainAndRightAnchorChainToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :left_anchor_chain, :int
    add_column :anchorings, :right_anchor_chain, :int
  end
end

module AnchoringsHelper
  def anchor_chain_options
    ANCHOR_CHAIN.map { |value| [I18n.t(value, scope: [:anchorings, :edit_anchor_sail]), value] }
  end
end

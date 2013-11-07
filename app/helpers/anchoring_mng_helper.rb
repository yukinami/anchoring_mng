module AnchoringMngHelper
  def order_by_options
    ORDERBYS.map { |value| [I18n.t(value, scope: [:anchoring_mng, :history]), value] }
  end
  
  def order_options
    ORDERS.map { |value| [I18n.t(value, scope: [:anchoring_mng, :history]), value] }
  end

end

class Anchoring < ActiveRecord::Base
  attr_accessible :anchor_reason, :amount, :anchor_date, :cargo, :cellphone, :contacter, :country, :fax, :gt, :max_draft, :nt, :pier, :power, :sail_date, :ship_contact, :ship_length, :ship_name, :ship_name_en, :category, :status, :anchorage_ground_id, :actual_anchor_date, :actual_sail_date
  belongs_to :anchorage_ground
  belongs_to :confirm_attn, class_name: "User", foreign_key: "confirm_attn_id"
  belongs_to :anchor_attn, class_name: "User", foreign_key: "anchor_attn_id"
  belongs_to :sail_attn, class_name: "User", foreign_key: "sail_attn_id"

  validates :anchorage_ground_id, presence: true, if: :is_confirmed?

  def is_confirmed?
    return status == 'confirmed'
  end

  scope :none, where(:id => nil).where("id IS NOT ?", nil)
end

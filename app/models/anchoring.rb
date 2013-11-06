class Anchoring < ActiveRecord::Base
  attr_accessible :anchor_reason, :amount, :anchor_date, :cargo, :cellphone, :contacter, :country, :fax, :gt, :max_draft, :nt, :pier, :power, :sail_date, :ship_contact, :ship_length, :ship_name, :ship_name_en, :category, :status, :anchorage_ground_id
  belongs_to :anchorage_ground
  
  validates :anchorage_ground_id, presence: true, if: :is_confirmed?

  def is_confirmed?
    return status == 'confirmed'
  end

end

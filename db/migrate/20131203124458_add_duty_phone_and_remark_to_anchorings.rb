class AddDutyPhoneAndRemarkToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :duty_phone, :string
    add_column :anchorings, :remark, :string
  end
end

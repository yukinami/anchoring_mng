class AddReportOrgToAnchorings < ActiveRecord::Migration
  def change
    add_column :anchorings, :report_org, :string
  end
end

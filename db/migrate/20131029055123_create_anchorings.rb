class CreateAnchorings < ActiveRecord::Migration
  def change
    create_table :anchorings do |t|
      t.string :type
      t.string :ship_name
      t.string :ship_name_en
      t.string :country
      t.integer :ship_length
      t.string :cargo
      t.integer :amount
      t.integer :gt
      t.integer :nt
      t.integer :max_draft
      t.integer :power
      t.string :anchor_reason
      t.date :anchor_date
      t.date :sail_date
      t.string :pier
      t.string :ship_contact
      t.string :contacter
      t.string :cellphone
      t.string :fax

      t.timestamps
    end
  end
end

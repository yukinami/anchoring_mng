class CreateAnchorageGrounds < ActiveRecord::Migration
  def change
    create_table :anchorage_grounds do |t|
      t.string :name

      t.timestamps
    end
  end
end

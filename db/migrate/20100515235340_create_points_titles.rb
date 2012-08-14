class CreatePointsTitles < ActiveRecord::Migration
  def self.up
    create_table :points_titles do |t|
      t.integer :section_id
      t.integer :item_id
      t.string :text
      t.timestamps
    end
  end

  def self.down
    drop_table :points_titles
  end
end

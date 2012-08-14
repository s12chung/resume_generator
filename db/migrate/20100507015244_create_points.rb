class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.integer :section_id
      t.integer :item_id
      t.integer :points_title_id
      t.string :title
      t.text :text
      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end

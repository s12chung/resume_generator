class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :section_id
      t.string :title
      t.string :organization
      t.string :organization_description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

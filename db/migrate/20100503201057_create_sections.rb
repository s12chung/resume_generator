class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :resume_id
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end

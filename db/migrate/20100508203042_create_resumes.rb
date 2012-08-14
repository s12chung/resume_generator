class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
      t.string :resume_name
      t.string :full_name
      t.string :secondary_info
      t.string :mobile
      t.string :email
      t.integer :address_id
      t.timestamps
    end
  end

  def self.down
    drop_table :resumes
  end
end
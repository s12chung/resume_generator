class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line_1
      t.string :city
      t.string :province
      t.string :postal_code
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
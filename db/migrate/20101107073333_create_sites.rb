class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :owner_name
      t.string :owner_email
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end

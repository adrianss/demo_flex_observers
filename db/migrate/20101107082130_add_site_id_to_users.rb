class AddSiteIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :site, :references
  end

  def self.down
    remove_column :users, :site
  end
end

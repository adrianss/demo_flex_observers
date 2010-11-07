class AddSiteIdAndUserIdToSiteUserInfos < ActiveRecord::Migration
  def self.up
    add_column :site_user_infos, :site, :references
    add_column :site_user_infos, :user, :references
  end

  def self.down
    remove_column :site_user_infos, :user
    remove_column :site_user_infos, :site
  end
end

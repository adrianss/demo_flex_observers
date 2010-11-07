class AddSiteIdAndUserIdToSiteUserInfos < ActiveRecord::Migration
  def self.up
    add_column :site_user_infos, :site_id, :integer
    add_column :site_user_infos, :user_id, :integer
  end

  def self.down
    remove_column :site_user_infos, :user_id
    remove_column :site_user_infos, :site_id
  end
end

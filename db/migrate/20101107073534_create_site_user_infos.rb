class CreateSiteUserInfos < ActiveRecord::Migration
  def self.up
    create_table :site_user_infos do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :site_user_infos
  end
end

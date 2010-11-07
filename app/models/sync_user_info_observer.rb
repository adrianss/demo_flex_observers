class SyncUserInfoObserver < ActiveRecord::Observer
  observe :user
  
  def after_save(user)
    sync_site_user_info(user)
  end

  def sync_site_user_info(user)
    SiteUserInfo.update_or_create_by_user(user)
  end
end

class UserObserver < ActiveRecord::Observer
  def after_save(user)
    sync_site_info(user)
  end

  def after_destroy(user)
    delete_record_for_site_user_info(user)
  end

  private
  def sync_site_info(user)
    if user.owner
      owner_user = user
      site = user.site
      if (owner_user.name != site.owner_name) || (owner_user.email != site.owner_email)
        site.owner_name = owner_user.name
        site.owner_email = owner_user.email
        site.without_observers("SiteObserver") do
          site.save
        end
      end
    end
  end

  def delete_record_for_site_user_info(user)
    site_user_info = SiteUserInfo.where(:user_id => user.id, :site_id => user.site_id).first
    site_user_info.destroy if site_user_info
  end
end

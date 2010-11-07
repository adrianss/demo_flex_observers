class UserObserver < ActiveRecord::Observer
  def after_save(site)
    sync_site_info(user)
    sync_site_user_info(user)
  end

  private
  def sync_site_info(user)
    if user.owner
      owner_user = user
      site = user.site
      if (owner_user.name != site.contact_name) || (owner_user.email != site.contact_email)
        site.contact_name = owner_user.name
        site.contact_email = owner_user.email
        site.without_observers("SiteObserver") do
          site.save
        end
      end
    end
  end

  def sync_site_user_info(user)
    SiteUserInfo.update_or_create_by_user(user)
  end
end

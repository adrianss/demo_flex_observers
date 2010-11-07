class SiteObserver < ActiveRecord::Observer
  def after_save(site)
    sync_user_info(site)
  end
  
  def after_create(site)
    site.create_owner_user
  end
  
  private
  def sync_user_info(site)
    owner_user = site.owner_user
    if owner_user
      if (owner_user.name != site.contact_name) || (owner_user.email != site.contact_email)
        owner_user.name = site.contact_name
        owner_user.email = site.contact_email
        owner_user.without_observers("UserObserver") do
          owner_user.save
        end
      end
    end
  end
end

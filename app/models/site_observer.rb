class SiteObserver < ActiveRecord::Observer
  def after_save(site)
    sync_user_info(site)
  end
  
  def after_create(site)
    site.create_owner_user
  end

  def after_destroy(site)
    delete_records_for_site_user_info(site)
  end
  
  private
  def sync_user_info(site)
    owner_user = site.owner_user
    if owner_user
      if (owner_user.name != site.owner_name) || (owner_user.email != site.owner_email)
        owner_user.name = site.owner_name
        owner_user.email = site.owner_email
        owner_user.without_observers("UserObserver") do
          owner_user.save
        end
      end
    end
  end

  def delete_records_for_site_user_info(site)
    SiteUserInfo.where(:site_id => site.id).each do |site_user_info|
      site_user_info.destroy
    end
    User.where(:site_id => site.id).each do |user|
      user.destroy
    end
  end
end

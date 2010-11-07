class SiteUserInfo < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  
  def self.update_or_create_by_user(user)
    site_user_info = where(:site_id => user.site_id,
                           :user_id => user.id).first
    if site_user_info
      site_user_info.update_attributes({
                                    :image_url => user.image_url,
                                    :name => user.name,
                                    :email => user.email
                                  })
    else
      create(:site_id => user.site_id,
             :user_id => user.id,
             :image_url => user.image_url,
             :name => user.name,
             :email => user.email)
    end
  end
end

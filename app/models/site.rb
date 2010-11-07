class Site < ActiveRecord::Base
  has_many :users

  def create_owner_user
    users.create({ :name => self.owner_name,
                   :email => self.owner_email,
                   :owner => true })
  end

  def owner_user
    users.where(:owner => true).first
  end
end

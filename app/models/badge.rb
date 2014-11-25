class Badge < ActiveRecord::Base

  belongs_to :user

  BADGES = ['Office Angel', 'Badge 2', 'Badge 3']

  def create_new_badge(name)
    BADGES << name.to_s
  end

end

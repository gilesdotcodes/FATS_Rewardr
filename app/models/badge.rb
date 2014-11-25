class Badge < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :user_id

  BADGES = ['office angel', 'star man', 'best sales', 'outstanding customer service', 'lean on me', 'positive vibes']

end

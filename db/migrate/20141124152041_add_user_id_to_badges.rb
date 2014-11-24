class AddUserIdToBadges < ActiveRecord::Migration
  def change
    add_reference :badges, :user, index: true
  end
end

class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @my_badges = []
    @my_badges = Badge.where(:user_id => current_user.id)
  end

end

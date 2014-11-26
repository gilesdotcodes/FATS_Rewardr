class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @my_badges = []
    @my_badges = Badge.where(:user_id => current_user.id)
    @all_badges = Badge.last(3).reverse
  end

  def profile
    @my_badges = Badge.where(:user_id => current_user.id)
    @all_badges = Badge.last(10).reverse
  end

end

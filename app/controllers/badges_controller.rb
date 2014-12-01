class BadgesController < ApplicationController

  before_action :authenticate_user!

  def new
    if current_user.role == "admin"
      @badge = Badge.new
      # @user_list = User.all
    else
      redirect_to '/users/show'
    end
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.name = @badge.name.downcase
    @user = User.find(params[:badge][:user])
    @badge.user_id = @user.id
    if @badge.save
      flash[:notice] = "Success"
      redirect_to '/users/show'
    else @badge.delete
      flash[:notice] = "Error! Something went wrong"
      redirect_to '/users/show'
    end
  end

  def badge_params
    params.require(:badge).permit(:name)
  end

end

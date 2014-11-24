class BadgesController < ApplicationController

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
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

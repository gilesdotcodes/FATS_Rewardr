class BadgesController < ApplicationController

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.name = @badge.name.downcase
    @user = User.find(params[:badge][:user])
    @badge.user_id = @user.id
    if @badge.save
      flash[:notice] = "Success"
      Badge::BADGES << @badge.name.to_s if !Badge::BADGES.include?(@badge.name)
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

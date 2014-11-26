class RegistrationsController < Devise::RegistrationsController
  def update

    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      flash[:notice] = 'Thank you! Your profile has been successfully updated.'
      sign_in @user, :bypass => true
      redirect_to users_profile_path
    else
      render "edit"
    end
  end
end
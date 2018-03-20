class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      activate_user user
    else
      notactivate_user
    end
  end

  private

  def activate_user user
    user.activate
    log_in user
    flash[:success] = t "activated"
    redirect_to user
  end

  def notactivate_user
    flash[:danger] = t "error_activate"
    redirect_to root_url
  end
end

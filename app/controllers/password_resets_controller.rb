class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, :check_expiration,
    only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    user ? info_email : danger_email
  end

  def edit; end

  def update
    return empty_password if params[:user][:password].empty?
    return update_success if user.update_attributes user_params
    render :edit
  end

  private

  attr_reader :user

  def info_email
    user.create_reset_digest
    user.send_password_reset_email
    flash[:info] = t "info_email"
    redirect_to root_url
  end

  def danger_email
    flash.now[:danger] = t "danger_email"
    render :new
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by email: params[:email]
    return if user
    flash[:danger] = t "danger_email"
    redirect_to root_path
  end

  def valid_user
    return if user && user.activated? && user.authenticated?(:reset,
      params[:id])
    redirect_to root_url
  end

  def check_expiration
    return unless user.password_reset_expired?
    flash[:danger] = t "expired"
    redirect_to new_password_reset_url
  end

  def empty_password
    user.errors.add :password, t("empty")
    render :edit
  end

  def update_success
    log_in user
    flash[:success] = t "reseted"
    redirect_to user
  end
end

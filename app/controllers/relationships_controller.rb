class RelationshipsController < ApplicationController
  before_action :logged_in_user

  attr_reader :user

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow user
    respond_ajax user
  end

  def destroy
    @user = Relationship.find_by id: params[:id]
    return user_not_found if user.blank?
    current_user.unfollow user.followed
    respond_ajax user.followed
  end

  private

  def user_not_found
    flash[:error] = t "not_found"
    redirect_to root_path
  end

  def respond_ajax user
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end
end

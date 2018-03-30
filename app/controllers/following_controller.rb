class FollowingController < ApplicationController
  attr_reader :user
  def index
    @title = t "following"
    @user  = User.find_by id: params[:id]
    @users = user.following.paginate page: params[:page]
    render :show_follow
  end
end

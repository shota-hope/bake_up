class RelationshipsController < ApplicationController
  before_action :user_signed_in?

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    flash[:success] = "フォローしました"
    @user.create_notification_follow!(current_user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    flash[:success] = "フォロー解除しました"
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end

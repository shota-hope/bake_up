class FavoriteRelationshipsController < ApplicationController
  before_action :user_signed_in?

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end

  def destroy
    @user = current_user
    @post = FavoriteRelationship.find(params[:id]).post
    current_user.unlike(@post)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end
end

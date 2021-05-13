class FavoriteRelationshipsController < ApplicationController
  before_action :user_signed_in?

  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    post = FavoriteRelationship.find(params[:id]).post
    current_user.unlike(post)
    redirect_back(fallback_location: root_url)
  end
end

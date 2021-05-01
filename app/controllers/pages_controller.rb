class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end

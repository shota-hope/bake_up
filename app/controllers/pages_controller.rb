class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    @post = current_user.posts.build if user_signed_in?
  end

end

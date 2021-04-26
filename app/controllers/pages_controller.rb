class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
end

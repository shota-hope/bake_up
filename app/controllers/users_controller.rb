class UsersController < ApplicationController
  before_action :sign_in_required, only: [:index, :show]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
end

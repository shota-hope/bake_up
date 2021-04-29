class PostsController < ApplicationController
  before_action :sign_in_required, only:[:create, :destroy]

  def create
  end

  def destroy
  end
end

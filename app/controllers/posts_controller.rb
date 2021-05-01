class PostsController < ApplicationController
  before_action :sign_in_required, only:[:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
       flash[:succuess] = "投稿しました"
       redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'pages/index'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end

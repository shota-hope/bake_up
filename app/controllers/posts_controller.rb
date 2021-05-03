class PostsController < ApplicationController
  before_action :sign_in_required, only:[:show, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
       flash[:success] = "投稿しました"
       redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'pages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end

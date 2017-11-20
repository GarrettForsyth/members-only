class PostsController < ApplicationController

  before_filter :is_signed_in?, only: [:new, :create]

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if (@post.save)
      redirect_to posts_path
    else
      redirect_to root_url
    end
  end

  def index
    @posts = Post.all
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def is_signed_in?
    if current_user.nil?
      flash[:danger] = "Please sign in before making posts."
      redirect_to root_url
    end
  end

end

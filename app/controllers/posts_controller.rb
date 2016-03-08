class PostsController < ApplicationController
  before_filter :check_user_presence

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:user, comments: :user).find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post created'
    else
      render 'edit'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy
      redirect_to root_path, notice: 'Post removed'
    else
      redirect_to post_path(@post), notice: 'Post could not be removed'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def check_user_presence
    return if current_user.present?
    redirect_to new_user_session_path, notice: 'You have to be signed in.'
  end
end

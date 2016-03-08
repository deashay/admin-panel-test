module Posts
  class CommentsController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(user: current_user)
      if @comment.update(comment_params)
        redirect_to post_path(@post), notice: 'Comment created'
      else
        redirect_to post_path(@post), notice: 'Comment not created'
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      if @comment.user == current_user
        @comment.destroy
        redirect_to post_path(@post), notice: 'Comment removed'
      else
        redirect_to post_path(@post), notice: 'Comment not removed'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end

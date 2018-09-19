class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment][:post_id]

    @comment.save

    flash[:errors] = @comment.errors.full_messages

    redirect_to post_url(@comment.post_id)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

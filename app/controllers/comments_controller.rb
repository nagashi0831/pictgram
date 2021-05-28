class CommentsController < ApplicationController
  def index
    
    @topic = Topic.find(params[:topic_id])
    @comments = Comment.includes(:user).where(topic_id: params[:topic_id])
    
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_index_path(topic_id: params[:comment][:topic_id]), success: "コメントを投稿しました"
    else
      flash.now[:danger] = "コメントを投稿できませんでした"
      render :index
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:description, :topic_id)
  end
end

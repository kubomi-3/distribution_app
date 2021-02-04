class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to subject_path(@comment.subject.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end
end

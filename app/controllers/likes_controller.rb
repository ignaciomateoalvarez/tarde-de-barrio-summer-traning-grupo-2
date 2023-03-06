class LikesController < ApplicationController
  before_action :find_comment

  def toggle_like
    LikesToggleManager.new(like_params[:user], @comment).call
    redirect_to student_path(student_params[:student_id])
  end

  def find_comment
    @comment = Comment.find(like_params[:comment_id])
  end

  private

  def like_params
    params.permit(:comment_id)
          .merge(user: current_user)
  end

  def student_params
    params.permit(:student_id)
  end
end

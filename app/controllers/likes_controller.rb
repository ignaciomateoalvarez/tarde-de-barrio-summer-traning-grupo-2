class LikesController < ApplicationController
  before_action :find_publication

  def toggle_like
    LikesToggleManager.new(like_params[:user], @comment).call
    redirect_to student_path(student_params[:student_id])
  end

  def toggle_post_like
    LikesToggleManager.new(like_post_params[:user], @comment).call
    redirect_to home_path
  end

  def find_publication
    @comment = Publication.find(params[:comment_id] ? like_params[:comment_id] : like_params[:post_id])
  end

  private

  def like_params
    params.permit(:comment_id, :post_id)
          .merge(user: current_user)
  end

  def like_post_params
    params.permit(:post_id)
          .merge(user: current_user)
  end

  def student_params
    params.permit(:student_id)
  end
end

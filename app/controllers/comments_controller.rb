class CommentsController < ApplicationController
  include Pundit::Authorization 

  def create
    authorize Comment
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to student_path(comment_params[:student_id]), success: t('.created')
    else
      redirect_to student_path([:student_id]), warning: t('.not_created')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :highlight)
                            .merge(user: current_user, student_id: params[:student_id])
  end
end
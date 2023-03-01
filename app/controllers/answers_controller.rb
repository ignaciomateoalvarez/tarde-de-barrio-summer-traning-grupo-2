class AnswersController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.create(body: params[:body], user: current_user)
    redirect_to student_path(params[:student_id]), 
                @answer.persisted? ? { success: t('.created') } : { warning: t('.not_created') }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :comment_id, :user)
  end
end

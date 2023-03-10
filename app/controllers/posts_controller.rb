class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to home_path, success: t('comments.create.created')
    else
      redirect_to home_path, warning: t('comments.create.not_created')
    end
  end

  private

  def post_params
    params.require(:comment).permit(:comment, :highlight, { files: [] }, { files_cache: [] }, { remove_file: [] })
                            .merge(user: current_user)
  end
end

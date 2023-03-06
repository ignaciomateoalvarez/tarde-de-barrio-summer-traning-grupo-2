class LikesToggleManager
  attr_reader :user, :comment

  def initialize(user, comment)
    @comment = comment
    @user = user
  end

  def call
    if @comment.likes.where(user_id: user.id).exists?
      @comment.likes.find_by(user_id: user.id).destroy
    else 
      @comment.likes.create(user_id: user.id)
    end
  end
end

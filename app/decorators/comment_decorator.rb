class CommentDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  def name
    user.first_name
  end

  def hour
    created_at.to_fs(:time)
    #created_at.in_time_zone('America/Buenos_Aires').to_fs(:time)
  end

  def user_comment
    comment.comment
  end
end
class PublicationDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  def name
    user.first_name
  end

  def hour
    created_at.to_fs(:time)
  end

  def format_date
    I18n.l(created_at, format: '%A %d de %B')
  end

  def user_comment
    publication.comment
  end

  def like?
    publication.likes.where(user_id: current_user.id).exists?
  end
end

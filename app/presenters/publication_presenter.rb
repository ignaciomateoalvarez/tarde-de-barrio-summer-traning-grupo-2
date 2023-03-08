class PublicationPresenter
  attr_reader :params, :highlighted, :not_highlighted

  def initialize(params)
    @params = params
    setup_posts
  end

  def setup_posts
    @highlighted = Post.where(highlight: true)
                       .decorate
                       .group_by { |c| c.created_at.to_date }
    @not_highlighted = Post.where(highlight: false)
                       .order(created_at: :desc)
                       .decorate
                       .group_by { |c| c.created_at.to_date }
  end
end

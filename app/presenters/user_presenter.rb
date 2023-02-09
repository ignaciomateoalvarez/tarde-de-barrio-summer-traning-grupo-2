class UserPresenter
  def initialize(params)
    @params = params
  end

  def filter
    @filter ||= UserFilter.new(User.all, params)
  end

  def user
    @user ||= filter.call
  end
end

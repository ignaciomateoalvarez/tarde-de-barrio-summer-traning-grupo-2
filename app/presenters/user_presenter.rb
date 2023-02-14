class UserPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def users
    @users ||= filter.call.order(:first_name)
  end

  def filter
    @filter ||= UserFilter.new(User.all, filter_params)
  end

  private

  def filter_params
    params
      .fetch(:user_filter, {})
      .permit(:full_name)
  end
end

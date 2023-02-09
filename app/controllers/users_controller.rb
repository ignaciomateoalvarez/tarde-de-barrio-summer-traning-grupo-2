class UsersController < ApplicationController
  def index
    @filter = UserFilter.new(User.all, filter_params)
    @user = @filter.call
    @pagy, @users = pagy(@user, items: 10)
  end

  def filter_params
    params
      .fetch(:user_filter, {})
      .permit(:full_name)
  end
end

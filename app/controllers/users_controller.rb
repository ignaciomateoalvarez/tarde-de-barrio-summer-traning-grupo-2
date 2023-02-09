class UsersController < ApplicationController
  def index
    @filter = UserFilter.new(User.all, filter_params)
    @user = @filter.call.order(:first_name)
    @pagy, @users = pagy(@user, items: 10)
  end

  def filter_params
    params
      .fetch(:user_filter, {})
      .permit(:full_name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.save
      redirect_to users_path, notice: 'Created user successfully'
    else
      redirect_to users_path, alert: 'Could not create user'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(register_params)
      flash[:notice] = 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy; end

  def toggle_active
    @user = User.find(params[:user_id])
    @user.toggle!(:active)
    redirect_to users_path
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

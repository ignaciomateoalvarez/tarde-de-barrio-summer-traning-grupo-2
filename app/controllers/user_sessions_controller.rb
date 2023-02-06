class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to home_path, notice: 'Welcome!'

    else
      redirect_to root_path, notice: 'User not found'
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end
